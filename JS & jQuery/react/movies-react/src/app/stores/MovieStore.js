const AppDispatcher = require('../dispatcher/AppDispatcher'),
  AppConstants = require('../constants/AppConstants');
import _ from "underscore";
import EventEmitter from "events";

let CHANGE_EVENT = "CHANGE";

var MovieStore = _.extend({}, EventEmitter.prototype, {
  movies: [],
  findMovie: function(id) {
    return this.movies.find((movie) => {
      if(parseInt(movie._id) === parseInt(id)){
        return movie
      }
    })
  },
  setMovies: function(data){
    this.movies = data
    console.log('store = ', this.getAllMovies());
  },
  getAllMovies: function() {
    return this.movies;
  },
  updateMovie: function(newMovie){
    console.log('trigger update movie with id:', newMovie, newMovie._id );
    var movie = this.findMovie(newMovie._id)
    console.log('Found movie with name ', movie.name );
    var index = this.movies.findIndex((oldMovie) => oldMovie._id === newMovie._id)
    console.log('movie has index in array of', index);
    this.movies[index] = newMovie
    console.log('store = ', this.getAllMovies());
  },
  addMovie: function(movie) {
    this.movies.push(movie)
    console.log('store = ', this.getAllMovies());
  },
  deleteMovie: function(id){
    var movie = this.findMovie(id)
    console.log('Found movie with name ', movie.name );
    var index = this.movies.findIndex((movie) => movie._id === id)
    this.movies.splice(index, 1)
    console.log('store = ', this.getAllMovies());
  },
  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback)
  },
  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback)
  },
  emitChange: function() {
    this.emit(CHANGE_EVENT);
  }
})

AppDispatcher.register(function(data) {
  console.log("hitting store with ", data, data.action);
  switch (data.action.actionType) {
    case AppConstants.ADD_MOVIE:
    console.log("Adding movie to the store!");
      MovieStore.addMovie(data.action.data)
      MovieStore.emitChange();
      break;
    case AppConstants.GET_ALL_MOVIES:
    console.log("Adding all movies from the store!");
      MovieStore.setMovies(data.action.data)
      MovieStore.emitChange();
      break;
    case AppConstants.CREATE_MOVIE:
    console.log("Adding single movie to store!");
      MovieStore.addMovie(data.action.data);
      MovieStore.emitChange();
      break;
    case AppConstants.UPDATE_MOVIE:
    console.log("Updating existing movie in store!");
      MovieStore.updateMovie(data.action.data);
      MovieStore.emitChange();
      break;
    case AppConstants.DELETE_MOVIE:
      console.log("Deleting movie from store!");
      MovieStore.deleteMovie(data.action.data);
      MovieStore.emitChange();
      break;
    default:
  }
  return true;
})

module.exports = MovieStore;
