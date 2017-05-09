// Dependencies
var express = require("express")
var router = express.Router()

// Models
var Movie = require("../models/movie")

// Routes
Movie.methods(["get","put","post","patch","delete"])
Movie.register(router, "/movies")

// Return router
module.exports = router;
