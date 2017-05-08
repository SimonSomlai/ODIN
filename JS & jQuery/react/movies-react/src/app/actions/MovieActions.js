const AppDispatcher = require('../dispatcher/AppDispatcher'),
    AppConstants = require('../constants/AppConstants');
import MovieApi from "../services/MovieApi"

// Define action methods
let MovieActions = {
  getMovies: () => {
    console.log("trigger action");
      AppDispatcher.handleAction({actionType: AppConstants.GET_MOVIES,data: {} });
  },

  addMovie: (movie) => {
    console.log("trigger create action");
      AppDispatcher.handleAction({actionType: AppConstants.CREATE_MOVIE,data: movie });
  },

  updateMovie: (newMovie) => {
    console.log("trigger update action");
      AppDispatcher.handleAction({actionType: AppConstants.UPDATE_MOVIE, data: {movie: newMovie}});
  },

  deleteMovie: (id) => {
    console.log("trigger delete action");
      AppDispatcher.handleAction({actionType: AppConstants.DELETE_MOVIE, data: id});
  }
};

module.exports = MovieActions;
