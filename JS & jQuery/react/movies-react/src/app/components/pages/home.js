import React, {Component} from 'react';
import ReactDOM from "react-dom"
import {PageHeader} from 'react-bootstrap';
import Movie from "../movies/movie.js"
import MovieStore from "../../stores/MovieStore.js"
import MovieActions from "../../actions/MovieActions.js"


class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {
      movies: MovieStore.getAllMovies()
    }
  }

  // Helper Functions

  getAllMovies(){
    MovieActions.getAllMovies(); // Get data from store
  }

  handleStoreChange(){
    var data = MovieStore.getAllMovies();
    this.setState({movies: data});
  }

  // Lifecycle Functions

  componentWillMount(){
  // Add a listener to the store, so when it changes handle store change can be fired which eventually re-renders the component
   MovieStore.addChangeListener(this.handleStoreChange.bind(this));
   this.getAllMovies()
  }

  componentWillUnmount(){
    // Remove the listener from the component.
    MovieStore.removeChangeListener(this.handleStoreChange.bind(this));
  }

  // Render Function

  renderMovies() {
    var allMovies = []
    this.state.movies.map((movie, i) => {
      allMovies.push(<Movie key={i} movie={movie}/>)
    })
    return allMovies
  }

  render() {
    return (
      <section id="content">
        <div className="content-wrap">
          <div className="container clearfix">
            <div className="row row-movies">
              {this.renderMovies()}
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Home;
