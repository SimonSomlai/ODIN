import React, {Component} from "react"
import ReactDOM from "react-dom"
import Dispatcher from "../../dispatcher/AppDispatcher"
import DinosaurActions from "../../actions/DinosaurActions"
import DinosaurStore from "../../stores/DinosaurStore"
import {capitalizeFirstLetter} from "../../utils/utils"

class DinosaurDetail extends Component {
  constructor(props) {
    super(props)
    this.state = {
      id: "",
      name: "",
      dinosaur_type: "",
      height: "",
      weight: "",
      isEditing: false
    }
  }

  componentWillMount(){
    var dinosaur = DinosaurStore.findDinosaur(this.props.params.id) // Check if dinosaur exists in the store
    if(dinosaur){ // If it does, set current state & re-render component
      console.log("dinosaur found in the store", dinosaur);
      this.setState(dinosaur)
    } else { // Else get it from the server
      console.log("dinosaur wasn't in the store, getting it from api");
      DinosaurStore.addChangeListener(this.handleDinosaurData.bind(this)); // Trigger when store updates
      DinosaurActions.getDinosaur(this.props.params.id)
    }
  }

  componentWillUnmount(){
    DinosaurStore.removeChangeListener(this.handleDinosaurData.bind(this));
  }

  handleDinosaurData(){
    const{id, name, weight, height, image, dinosaur_type} = DinosaurStore.findDinosaur(this.props.params.id);
    this.setState({id, name, weight, height, image, dinosaur_type, isEditing: false});
  }

  toggleEditing(){
    this.setState({isEditing: !this.state.isEditing});
  }

  updateDinosaur(){
    var formFields = this.refs, isEditing = this.state.isEditing; // Grab the refs from the fields & editing state
    for(var prop in formFields){
      this.state[prop] = formFields[prop].value; // Change the state fields
    }
    var newDinosaur = this.state; // Make a copy of state
    delete newDinosaur.isEditing; // Delete the isEditing key (shouldn't be changed)
    this.state.isEditing = !isEditing // Set editing to false
    DinosaurActions.updateDinosaur(this.state.id,newDinosaur); // Trigger action, which triggers dispatcher, which updates store, which broadcasts event
    this.setState(this.state);
  }

  renderDetails(){
    if(this.state.isEditing){
      return(<div className="card-block">
          <p className="card-text"><strong>Image-url: </strong> <input className="form-control" ref="image" type="text" defaultValue={this.state.image}/></p>
          <h4 className="card-title"><strong>Name: <input className="form-control" ref="name" type="text" defaultValue={this.state.name}/></strong></h4>
          <p className="card-text"><strong>Type: </strong>
          <select ref="dinosaur_type" className="form-control" name="type" defaultValue={this.state.dinosaur_type}>
            <option value="herbivore">
              herbivore
            </option>
            <option value="carnivor">
              carnivor
            </option>
          </select>
        </p>
          <p className="card-text"><strong>Weight: </strong> <input className="form-control" ref="weight" type="number" defaultValue={this.state.weight}/> kg</p>
          <p className="card-text"><strong>Height: </strong> <input className="form-control" ref="height" type="number" defaultValue={this.state.height}/> meters</p>
          <a onClick={() => this.toggleEditing()} className="btn btn-primary details">Cancel</a>
          <a onClick={() => this.updateDinosaur()} className="btn btn-success">Save</a>
        </div>)
    } else {
      return(<div className="card-block">
          <h4 className="card-title"><strong>{capitalizeFirstLetter(this.state.name)}</strong></h4>
          <p className="card-text"><strong>Type: </strong> {capitalizeFirstLetter(this.state.dinosaur_type)}</p>
          <p className="card-text"><strong>Weight: </strong> {this.state.weight} kg</p>
          <p className="card-text"><strong>Height: </strong> {this.state.height} meters</p>
          <a onClick={() => this.toggleEditing()} className="btn btn-primary">Edit</a>
        </div>)
    }
  }

  render() {
    return (
      <div className="container container-dinosaur">
        <div className="row">
          <div className="col-md-4 col-md-offset-4">
            <div className="card">
              <img className="card-img-top img-responsive" src={this.state.image} alt="Card image cap"/>
              {this.renderDetails()}
            </div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = DinosaurDetail;
