import React, {Component} from "react"
import ReactDOM from "react-dom"
import {Link} from "react-router"
import MovieActions from "../../actions/MovieActions.js"

class Movie extends Component {
  deleteMovie(id){
    MovieActions.deleteMovie(id)
  }

  render() {
    const {
      _id,
      name,
      actors,
      description,
      director,
      genre,
      images,
      release_date
    } = this.props.movie
    return (
      <div className="col-md-4 col-movie">
        <div className="card" >
          <img className="card-img-top" src={images[0]} alt="Card image cap"/>
          <div className="card-block">
            <h4 className="card-title">{name}</h4>
            <p className="card-text">{description}</p>
            <Link className="button button-3d button-inline button-black" to={"movies/" + _id}>See Details</Link>
            <button onClick={() => this.deleteMovie(_id)} className="button button-3d button-inline button-red" id="template-contactform-submit" name="template-contactform-submit" value="submit">Delete</button>
          </div>
        </div>
      </div>
    )
  }
}

export default Movie;
