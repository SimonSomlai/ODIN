import React from 'react';
import ReactDOM from 'react-dom';
import NavbarTop from './navigation/NavbarTop'

export default(props) => {
  return (
      <div>
        <NavbarTop/>
        <div className="main">
          {React.cloneElement(props.children)}
        </div>
      </div>
  )
}
