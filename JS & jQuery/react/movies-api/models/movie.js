var restful = require("node-restful");
var mongoose = restful.mongoose;

// Schema
var movieSchema = new mongoose.Schema({
    name: String,
    description: String,
    director: String,
    release_date: Number,
    actors: String,
    genre: String,
    images: Array })

// Return Model
module.exports = restful.model("Movies", movieSchema)
