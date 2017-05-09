var express = require('express');
var bodyParser = require("body-parser")
var mongoose = require("mongoose")

// Connect to mongoose
mongoose.connect("mongodb://127.0.0.1:27017/movies")
// mongoose.connect("mongodb://heroku_x33nptr2:un7aselo1tiaomak78f22lrek6@ds133241.mlab.com:33241/heroku_x33nptr2/movies")

var app = express();

// Add headers
app.use(function (req, res, next) {
    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3001');
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);
    // Pass to next layer of middleware
    next();
});

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json())

app.use("/api", require("./routes/api"))

app.listen(3000)
console.log('Connected!');
