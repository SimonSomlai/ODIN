const AppDispatcher = require('../dispatcher/AppDispatcher'),
    AppConstants = require('../constants/AppConstants');
import MovieApi from "../services/MovieApi"

// Define action methods
let MovieActions = {
  getAllMovies: () => {
    console.log('trigger get all movies action');
    MovieApi.getAllMovies(function(result){
      AppDispatcher.handleAction({actionType: AppConstants.GET_ALL_MOVIES, data: result });
    }, function(err){
      console.log(err);
    });
  },
  getMovie: (id) => {
    console.log('trigger find action');
    MovieApi.getMovie(id, function(result){
      AppDispatcher.handleAction({actionType: AppConstants.ADD_MOVIE, data: result });
    }, function(err){
      console.log(err);
    });
  },
  createMovie: (movie) => {
    console.log("trigger create action");
    MovieApi.createMovie(movie, function(result){
      AppDispatcher.handleAction({actionType: AppConstants.CREATE_MOVIE, data: result });
    }, function(err){
      console.log(err);
    });
  },

  updateMovie: (id, newMovie) => {
    console.log("trigger update action");
    MovieApi.updateMovie(id, newMovie, function(result){
      AppDispatcher.handleAction({actionType: AppConstants.UPDATE_MOVIE, data: newMovie});
    }, function(err){
      console.log(err);
    });
  },

  deleteMovie: (id) => {
    console.log("trigger delete action");
    MovieApi.deleteMovie(id, function(result){
      AppDispatcher.handleAction({actionType: AppConstants.DELETE_MOVIE, data: id});
    }, function(err){
      console.log(err);
    });
  }
};

module.exports = MovieActions;
