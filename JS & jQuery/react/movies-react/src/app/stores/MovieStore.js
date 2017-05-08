const AppDispatcher = require('../dispatcher/AppDispatcher'),
  AppConstants = require('../constants/AppConstants');
import _ from "underscore";
import EventEmitter from "events";

let CHANGE_EVENT = "CHANGE";

var MovieStore = _.extend({}, EventEmitter.prototype, {
  movies: [
    {
      id: 1,
      name: "Avatar",
      description: "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
      director: "James Cameron",
      release_date: 2013,
      actors: "Sam Worthington, Zoe Saldana, Sigourney Weaver",
      genre: "Fantasy",
      images: ["http://pre07.deviantart.net/d73d/th/pre/f/2013/162/d/5/d5b7f0268a6c237ead9e9b60f1b3e4da-d68mrmo.png", "http://wallpapercave.com/wp/EIV1vJb.jpg", "http://www.hdwallpapers.in/walls/neytiri_in_avatar_2-wide.jpg"]
    },
    {
      id: 2,
      name: "Gattaca",
      description: "A genetically inferior man assumes the identity of a superior one in order to pursue his lifelong dream of space travel.",
      director: "Andrew Niccol",
      release_date: 1997,
      actors: "Ethan Hawke, Uma Thurman, Jude Law",
      genre: "Drama, Sci-Fi",
      images: ["http://www.dominickevans.com/wp-content/uploads/2017/01/VincentGattaca-1170x680.jpg", "https://i.ytimg.com/vi/hWjlUj7Czlk/maxresdefault.jpg", "https://i.ytimg.com/vi/3kTdh-u5tis/maxresdefault.jpg"]
    }
  ],
  findMovie: function(id) {
    return this.movies.find((movie) => {
      if(parseInt(movie.id) === parseInt(id)){
        return movie
      }
    })
  },
  getMovies: function() {
    return this.movies;
  },
  addMovie: function(movie) {
    console.log("Adding new movie to the store!", movie);
    movie["id"] = this.getMovieData().length + 1;
    this.movies.push(movie)
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
    case AppConstants.CREATE_MOVIE:
    console.log("adding movie to store!");
      MovieStore.addMovie(data.action.data);
      MovieStore.emitChange();
      break;
    default:
  }
  return true;
})

module.exports = MovieStore;
