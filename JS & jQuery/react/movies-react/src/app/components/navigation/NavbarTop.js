import React, {Component} from 'react';
import {Navbar, Nav, NavItem, Glyphicon} from 'react-bootstrap';
import {LinkContainer, IndexLinkContainer} from 'react-router-bootstrap';
import {Link} from "react-router"

class NavbarTop extends Component {
  render() {
    return (
      <header id="header" className="page-section dark">
        <div id="header-wrap">
          <div className="container clearfix">
            <div id="primary-menu-trigger"><i className="icon-reorder"/></div>
            <nav id="primary-menu">
              <ul className="one-page-menu sf-js-enabled" style={{
                touchAction: 'pan-y'
              }}>
                <li className>
                  <Link to={"/"}>Home</Link>
                </li>
                <li className>
                  <Link to={"/movie/new"}>Add Movie</Link>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </header>
    );
  }
}

export default NavbarTop;
