import React, {Component} from 'react';
import {Navbar, Nav, NavItem, Glyphicon} from 'react-bootstrap';
import {LinkContainer, IndexLinkContainer} from 'react-router-bootstrap';

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
                <a className="header-link">
                  <div>Home</div>
                </a>
              </li>
              <li>
                <a className="header-link">
                  <div>Login</div>
                </a>
              </li>
              <li>
                <a className="header-link">
                  <div>Register</div>
                </a>
              </li>
              <li>
                <a className="header-link">
                  <div>FAQ</div>
                </a>
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
