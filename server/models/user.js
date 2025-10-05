const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true, //If someone adds space it removes it
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {    //ths is a fn which helps to add restriction over a particular field  
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@"]+(\.[^<>()[\]\.,;:\s@"]+)*)|(".+"))@(([^<>()[\]\.,;:\s@"]+\.)+[^<>()[\]\.,;:\s@"]{2,})$/i; //this is a regex which keeps a check that weathre the string has .com gmailand all
                return value.match(re);  //this returns an array after matching to conditions
            },
            message:"please enter a valid email"//if conditions not matched this runs
        },
    },
    password: {
        type: String,
        required:true,
        validate:{
            validator:(val)=>{
                return val.length>6;
            },
            message:"Password length is too small"
        }
    },
    address:{
        type:String,
        default:"",
    }, 
    type:{   //we will be making app for user but in future we can make an admin pannel as well for seller
        type:String, 
        default:"user",
    }
})

const User= mongoose.model('User',userSchema);
module.exports=User;