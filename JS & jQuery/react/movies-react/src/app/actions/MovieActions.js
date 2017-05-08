const AppDispatcher = require('../dispatcher/AppDispatcher'),
    AppConstants = require('../constants/AppConstants');
import MovieApi from "../services/MovieApi"

// Define action methods
let MovieActions = {
  getMovieData: () => {
    console.log("trigger action");
    MovieApi.getMovie(function(result){
      AppDispatcher.handleAction({actionType: AppConstants.MOVIE_LOADED,data: result });
    }, function(err){
      console.log(err);
    });
  },

  addMovie: (movie) => {
    console.log("trigger create action");
      AppDispatcher.handleAction({actionType: AppConstants.CREATE_MOVIE,data: movie });
  },

  updateMovie: (id, newMovie) => {
    console.log("trigger update action");
      AppDispatcher.handleAction({actionType: AppConstants.UPDATE_MOVIE, data: {id: id, newMovie: newMovie}});
  },

  deleteMovie: (id) => {
    console.log("trigger delete action");
      AppDispatcher.handleAction({actionType: AppConstants.DELETE_MOVIE, data: id});
  }
};

module.exports = MovieActions;
