import React, {Component} from "react"
import ReactDOM from "react-dom"
import {Link} from "react-router"

class Movie extends Component {
  render() {
    const {id, name, actors, description, director, genre, images, release_date} = this.props.movie
    return (
      <article className={"portfolio-item " + genre.replace(",", " ")}>
        <div className="portfolio-image">
          <div className="fslider" data-arrows="false" data-speed={400} data-pause={4000}>
            <div className="flexslider">
              <div className="slider-wrap">
                <div className="slide">
                  <a href="portfolio-single-gallery.html">
                  <img src={images[0]} alt={name}/>
                  </a>
                </div>
                <div className="slide">
                  <a href="portfolio-single-gallery.html">
                  <img src={images[1]} alt={name}/>
                  </a>
                </div>
                <div className="slide">
                  <a href="portfolio-single-gallery.html">
                  <img src={images[2]} alt={name}/>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div className="portfolio-overlay" data-lightbox="gallery">
            <a href={images[0]} className="left-icon" data-lightbox="gallery-item"><i className="icon-line-stack-2"/></a>
            <a href={images[1]} className="left-icon" data-lightbox="gallery-item"><i className="icon-line-stack-2"/></a>
            <a href={images[2]} className="hidden" data-lightbox="gallery-item"/>
            <Link className="right-icon" to={"/movies/" + id}><i className="icon-line-ellipsis"/></Link>
          </div>
        </div>
        <div className="portfolio-desc">
          <h3>
            <Link to={"/movies/" + id}>{name}</Link>
          </h3>
          <span>
            {genre.replace(",", " ")}
          </span>
        </div>
      </article>
    )
  }
}

export default Movie;
