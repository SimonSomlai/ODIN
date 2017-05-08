import React, {Component} from "react"
import ReactDOM from "react-dom"
import MovieStore from "../../stores/MovieStore.js"
import helper from "../../utils/utils"

class MovieDetail extends Component {
  constructor(props) {
    super(props)
    this.state = {
      id: "",
      name: "",
      description: "",
      director: "",
      release_date: "",
      actors: "",
      genre: "",
      images: []
    }
  }

  componentWillMount() {
    var movie = MovieStore.findMovie(this.props.params.id)
    this.setState(movie: movie)
  }

  render() {
    const {
      id,
      name,
      actors,
      description,
      director,
      genre,
      images,
      release_date
    } = this.state
    return (
      <section id="content">
        <div className="content-wrap">
          <div className="container clearfix">
            <div className="col_full portfolio-single-image">
              <div className="fslider" data-arrows="true" data-animation="slide">
                <div className="flexslider">
                  <div className="slider-wrap">
                    <div className="slide">
                      <a href="#"><img src={images[0]} alt/></a>
                    </div>
                    <div className="slide">
                      <a href="#"><img src={images[1]} alt/></a>
                    </div>
                    <div className="slide">
                      <a href="#"><img src={images[2]} alt/></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="col_one_third nobottommargin">
              <div className="panel panel-default events-meta">
                <div className="panel-body">
                  <ul className="portfolio-meta nobottommargin">
                    <li>
                      <span><i className="icon-user"/>Director:</span>{director}</li>
                    <li>
                      <span><i className="icon-calendar3"/>Released:</span>{release_date}</li>
                    <li>
                      <span><i className="icon-lightbulb"/>Actors:</span>{actors}</li>
                    <li>
                      <span><i className="icon-link"/>Genre:</span>
                      <a href="#">{genre}</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div className="col_two_third portfolio-single-content col_last nobottommargin">
              <div className="fancy-title title-dotted-border">
                <h2>{helper.capitalizeFirstLetter(name)}
                  Summary</h2>
              </div>
              <div className="col_half nobottommargin">
                <p>{description}</p>
              </div>
            </div>
            <div className="clear"/>
          </div>
        </div>
      </section>
    )
  }

}

export default MovieDetail;
