import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import NavbarTop from './navigation/NavbarTop'

class Template extends Component {
  render() {
    return (
      <div>
        <NavbarTop/>
        <div className="main">
          {React.cloneElement(props.children)}
        </div>
      </div>
    )
  }
}

module.exports = Template;
