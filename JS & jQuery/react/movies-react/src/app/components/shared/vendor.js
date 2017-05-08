import React, {Component} from 'react';
import ReactDOM from "react-dom"

class VendorScripts extends Component{
  render(){
    return(
      <div/>
    )
  }

  componentDidMount() {
    var node = ReactDOM.findDOMNode(this)
    const script = document.createElement("script");
    script.src = "https://s3-eu-west-1.amazonaws.com/truetech-v4/script.js";
    script.defer = true;
    node.appendChild(script);

    // start a new React render tree with our node and the children
    // passed in from above, this is the other side of the portal.
    ReactDOM.render(<div>{this.props.children}</div>, node);
  }
}

export default VendorScripts;
