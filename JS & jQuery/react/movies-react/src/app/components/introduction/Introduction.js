import React, {Component} from 'react';
import {PageHeader} from 'react-bootstrap';

class Introduction extends Component {
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
              <li>
                <a href="#" data-filter=".pf-illustrations">Illustrations</a>
              </li>
              <li>
                <a href="#" data-filter=".pf-uielements">UI Elements</a>
              </li>
              <li>
                <a href="#" data-filter=".pf-media">Media</a>
              </li>
              <li>
                <a href="#" data-filter=".pf-graphics">Graphics</a>
              </li>
            </ul>
            <div id="portfolio-shuffle" className="portfolio-shuffle" data-container="#portfolio">
              <i className="icon-random"/>
            </div>
            <div className="clear"/>
            <div id="portfolio" className="portfolio grid-container portfolio-3 portfolio-masonry clearfix">
              <article className="portfolio-item pf-icons pf-illustrations">
                <div className="portfolio-image">
                  <div className="fslider" data-arrows="false" data-speed={400} data-pause={4000}>
                    <div className="flexslider">
                      <div className="slider-wrap">
                        <div className="slide">
                          <a href="portfolio-single-gallery.html"><img src={require('../../../assets/styles/images/placeholder.png')} alt="Morning Dew"/></a>
                        </div>
                        <div className="slide">
                          <a href="portfolio-single-gallery.html"><img src={require('../../../assets/styles/images/placeholder.png')}b alt="Morning Dew"/></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className="portfolio-overlay" data-lightbox="gallery">
                    <a href={require('../../../assets/styles/images/placeholder.png')} className="left-icon" data-lightbox="gallery-item"><i className="icon-line-stack-2"/></a>
                    <a href={require('../../../assets/styles/images/placeholder.png')} className="hidden" data-lightbox="gallery-item"/>
                    <a href={require('../../../assets/styles/images/placeholder.png')} className="right-icon"><i className="icon-line-ellipsis"/></a>
                  </div>
                </div>
                <div className="portfolio-desc">
                  <h3>
                    <a href="portfolio-single-gallery.html">Morning Dew</a>
                  </h3>
                  <span><a href="#"/>
                    <a href="#">Icons</a>,
                    <a href="#">Illustrations</a>
                  </span>
                </div>
              </article>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Introduction;
