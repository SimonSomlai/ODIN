import React from 'react';
import {Navbar, Nav, NavItem, Glyphicon} from 'react-bootstrap';
import {LinkContainer, IndexLinkContainer} from 'react-router-bootstrap';

class NavbarTop extends React.Component {
  render() {
    return (
        <div>
          <Navbar fixedTop default>
            <Navbar.Header>
              <Navbar.Brand>
                <IndexLinkContainer to="/dinosaurs">
                  <a>Awesome Dinosaur App</a>
                </IndexLinkContainer>
              </Navbar.Brand>
              <Navbar.Toggle />
            </Navbar.Header>
            <Navbar.Collapse>
              <Nav>
                <IndexLinkContainer to="/dinosaurs">
                  <NavItem><Glyphicon glyph="flag"/> Home</NavItem>
                </IndexLinkContainer>
              </Nav>
            </Navbar.Collapse>
          </Navbar>
        </div>
    );
  }
}

export default NavbarTop;
