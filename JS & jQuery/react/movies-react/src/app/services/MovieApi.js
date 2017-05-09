var $ = require("jquery");

let MovieAPI = {
  getAllMovies: (success, error) => {
    console.log("getting all movies from api");
    $.ajax({url: 'http://localhost:3000/api/movies', method: 'GET', cache: false, dataType: 'json'
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  },
  getMovie: (id, success, error) => {
    console.log("getting movie from api with id", id);
    $.ajax({
      url: 'http://localhost:3000/api/movies/' + id,
      method: 'GET',
      cache: false,
      dataType: 'json'
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  },
  createMovie: (movie, success, error) => {
    console.log("creating new movie through api call", movie);
    $.ajax({
      url: 'http://localhost:3000/api/movies/',
      method: 'POST',
      cache: false,
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify(movie)
    }).done(function(result) {
      console.log('success', result);
      success(result);
    }).fail(function() {
      console.log('error');
      error();
    });
  },
  updateMovie: (id, newMovie, success, error) => {
    console.log("updating movie through api call with id", id, newMovie);
    var params = JSON.stringify(newMovie)
    console.log('params =', id, params);
    $.ajax({
      url: 'http://localhost:3000/api/movies/' + id,
      method: 'PUT',
      cache: false,
      dataType: 'json',
      contentType: 'application/json',
      data: params
    }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });

  },
  deleteMovie: (id, success, error) => {
  console.log("deleting movie through api call with id", id);
  $.ajax({
    "async": true,
    "crossDomain": true,
    "url": "http://localhost:3000/api/movies/" + id,
    "method": "DELETE"
  }).done(function(result) {
      success(result);
    }).fail(function() {
      error();
    });
  }
};

module.exports = MovieAPI;
