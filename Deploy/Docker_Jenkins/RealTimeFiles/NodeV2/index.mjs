import express from "express";
const app = express()


app.get("/",(req,res)=>{
    console.log("in main page")
    res.send("<h1>Welcomeeee samyak</h1>")
})

app.get("/about",(req,res)=>{
    console.log("in main about")

    res.send("<h1>about samyak</h1>")
})

app.listen(3003);
