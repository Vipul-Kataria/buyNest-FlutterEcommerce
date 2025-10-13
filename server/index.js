//INSTALLING DEPENDENCIES
require('dotenv').config(); 
const express = require("express");
const mongoose = require('mongoose');
const authRouter = require("./route/auth.js");
const adminRouter=require("./route/admin.js")
const User = require("../server/models/user.js")
const bcrypt = require('bcrypt');
const jwt=require("jsonwebtoken")
const auth=require("./middlewares/auth.js")
//MAKING BASIC CALLS
const app = express();
const PORT = 3000;

//IMPORTING OTHER LOCAL FILES
app.use(express.json());
app.use(authRouter);
app.use(adminRouter)

//MONGODB connection
const DB = process.env.MONGO_URI;
mongoose.connect(DB)
    .then(() => console.log('Connected!'));

app.listen(PORT,"0.0.0.0", () => {
    console.log(`App is listening at port ${PORT}`);
})

app.post("/api/signup", async (req, res) => {
    try {
        let { email, password, name } = req.body;
        const existingUser = await User.findOne({ email })
        if (existingUser) {
            return res.status(400).json({ msg: "User with same email already exists" })
        }
        const hashedPassword=await bcrypt.hash(password,8);  //(thing to be hashed,salt)
        let user = new User({
            email,
            password:hashedPassword,
            name,
        })
        user=await user.save();
        res.status(201).json({ msg: "User created successfully", user });
        console.log(req.body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ msg: "Internal server error" });
    }

})

//SIGNIN ROUTE


app.post("/api/signin", async(req,res)=>{
   try {
     let {email,password}=req.body;
 
     let user=await User.findOne({email});
     if(!user){
         return res.status(500).json({msg:"User with this email does not exist."});
     }
    const isMatch=await bcrypt.compare(password,user.password);  //it gives bool value
    if(!isMatch){
        return res.status(500).json({msg:"Incorrect password for the email entered"});
    }
    const token=jwt.sign({id:user._id},process.env.PASSWORD_KEY);
    res.json({token,...user._doc})
   } catch (error) {
        res.status(500).json({error:error.message});
   }

})

//TOKEN VALIDITY CHECK
app.post("/tokenIsValid",async(req,res)=>{
    try {
        const token=req.header("x-auth-token");
        if(!token){
            return res.json(false);
        }

        const isVerified=jwt.verify(token,process.env.PASSWORD_KEY);

        if(!isVerified){
            return res.json(false);
        }

        const user=await User.findById(isVerified.id);
        if(!user){
            return res.json(false);
        }
        res.json(true);
    } catch (error) {
        
    }
})


app.get('/',auth,async (req,res)=>{
    const user=await User.findById(req.user);
    res.json({...user._doc,token:req.token})
})