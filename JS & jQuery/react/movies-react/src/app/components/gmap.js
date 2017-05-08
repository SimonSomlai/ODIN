import React, {Component} from "react"
import ReactDOM from "react-dom"

class Gmap extends Component {
  shouldComponentUpdate() {
    // After it renders once, never rerender it with react. Just touch it with third party library
    return false;
  }

  componentDidMount() {
    // Create google map with librarys
    this.map = new google.maps.Map(this.refs.map, {
      center: {
        lat: this.props.lat,
        lng: this.props.lng
      },
      zoom: 8
    })
  }

  render() {
    return (
      <div ref="map" id="map"></div>
    )
  }
}

export default Gmap;
