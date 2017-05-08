import React, {Component} from 'react';
import ReactDOM from "react-dom"
import {PageHeader} from 'react-bootstrap';
import Movie from "../movies/movie.js"
import MovieStore from "../../stores/MovieStore.js"
import Gmap from "../gmap.js"

class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {
      movies: MovieStore.getMovies()
    }
  }

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
            <ul id="portfolio-filter" className="portfolio-filter clearfix" data-container="#portfolio">
              <li className="activeFilter">
                <a href="#" data-filter="*">Show All</a>
              </li>
              <li>
                <a href="#" data-filter=".pf-icons">Icons</a>
              </li>
            </ul>
            <div id="portfolio-shuffle" className="portfolio-shuffle" data-container="#portfolio">
              <i className="icon-random"/>
            </div>
            <div className="clear"/>
            <div id="portfolio" className="portfolio grid-container portfolio-3 portfolio-masonry clearfix">
              {this.renderMovies()}
            </div>
          </div>
        </div>
        <Gmap lat={-34.397} lng={150.644}/>
      </section>
    )
  }
}

export default Home;
