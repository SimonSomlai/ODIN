var express = require('express');
var bodyParser = require("body-parser")
var mongoose = require("mongoose")

// Connect to mongoose
mongoose.connect("mongodb://127.0.0.1:27017/movies")

var app = express();
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json())


app.use("/api", require("./routes/api"))

app.get("/", function(req, res) {
  res.send("hello world")
})

app.listen(3000)
console.log('Connected!');
