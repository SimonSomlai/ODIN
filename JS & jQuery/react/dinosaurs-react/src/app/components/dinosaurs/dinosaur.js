import React, {Component} from "react"
import ReactDOM from "react-dom"
import {Link} from "react-router"
import DinosaurActions from "../../actions/DinosaurActions"


class Dinosaur extends Component {
  constructor(props){
    super(props)
  }

  deleteDinosaur(){
    console.log("deleting dinosaur with id:",this.props.dinosaur.id);
    DinosaurActions.deleteDinosaur(this.props.dinosaur.id)
  }

  render() {
    const {id, name, image} = this.props.dinosaur
    return (
      <div className="col-xs-12 col-sm-12 col-md-3 col-dinosaur">
        <div className="col-item">
          <div className="post-img-content">
            <img src={image} className="img-responsive"/>
            <h3 className="post-title">
              <strong>{name}</strong>
            </h3>
          </div>
          <div className="info">
            <div className="separator clear-left">
              <p className="btn-add">
                <i className="fa fa-shopping-cart"></i>
                <Link className="details btn btn-sm btn-primary" to={"/dinosaurs/" + id}>Show</Link>
                <a onClick={() => this.deleteDinosaur()} className="btn btn-sm btn-danger">Delete</a>
              </p>
            </div>
            <div className="clearfix"></div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = Dinosaur;
