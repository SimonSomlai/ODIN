import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import NavbarTop from './navigation/NavbarTop'
import VendorScripts from "./shared/vendor.js"

class Template extends Component {
  render() {
    return (
      <div>
        <NavbarTop/>
        <div className="main">
          {React.cloneElement(this.props.children)}
        </div>
        <VendorScripts/>
      </div>
    )
  }
}

module.exports = Template;
