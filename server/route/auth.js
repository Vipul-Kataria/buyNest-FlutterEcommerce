const express = require("express");
const authRouter=express.Router();

authRouter.get("/user",(req,res)=>{
    res.send("hello i am an user")
})

module.exports=authRouter;