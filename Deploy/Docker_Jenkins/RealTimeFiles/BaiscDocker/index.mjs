import express from "express";
const app = express()
app.get("/",(req,res)=>{
    res.send("<h1>Welcome samyak</h1>")
})

app.get("/about",(req,res)=>{
    res.send("<h1>about samyak</h1>")
})

app.listen(3000);