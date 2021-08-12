const functions = require("firebase-functions");


exports.HelloWolrd = functions.https.onRequest((request,response)=>{
    response.send("Hello from FireBase")
});


