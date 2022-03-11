const express = require("express")
const exists = require("fs")
const bodyParser = require("body-parser")
const path = require("path")
const fs = require("fs").promises

const app = express()

app.use("/assets",expres.static("assets"))

app.get("/",(req,res)=>{
    console.log("in main page")
    res.send("<h1>Welcomeeee samyak</h1>")
})

app.get("/about",(req,res)=>{
    console.log("in main about")

    res.send("<h1>about samyak</h1>")
})


app.get("/create",async(req,res)=>{
    console.log("in main about")
    let filename = req.query.filename;
    let content = req.query.content;
    const fullpath = path.join(
        __dirname,
        "assets",
        filename.toLocaleLowerCase()+".txt"
    );

    console.log(`File is ${fullpath} and content ${content}`)
    await fs.writeFile(fullpath,content)
    res.send("<h1>File created successfully</h1>")
})

app.listen(3000);