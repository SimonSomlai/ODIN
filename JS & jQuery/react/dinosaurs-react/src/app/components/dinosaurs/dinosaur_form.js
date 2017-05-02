import React, {Component} from "react";
import ReactDOM from "react-dom";
import DinosaurStore from "../../stores/DinosaurStore";
import DinosaurActions from "../../actions/DinosaurActions";


class DinosaurForm extends Component{
  constructor(props){
    super(props);
    this.state = {
      name: "",
      height: 0,
      weight: 0,
      dinosaur_type: "herbivor",
      image: ""
    }
  }

  // Update the state on typing
  updateInput(e){
    console.log(e.target.name, " = ", e.target.value);
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e){
    e.preventDefault();
    var formFields = this.refs
    // Clear fields with loop
    for(var prop in formFields){
      formFields[prop].value = ""
    }
    DinosaurActions.addDinosaur(this.state);
  }

  render(){
    return(
      <form className="form-inline" onSubmit={(e) => this.handleSubmit(e)}>
        <h1>Make-A-Dino</h1>
        <div className="form-group">
          <input ref="name" onChange={(e) => this.updateInput(e)} type="text" className="form-control" placeholder="name" name="name"/>
          <select ref="dinosaur_type" onChange={(e) => this.updateInput(e)} className="form-control" name="dinosaur_type">
            <option value="herbivore">
              herbivore
            </option>
            <option value="carnivor">
              carnivor
            </option>
          </select>
          <input ref="weight" onChange={(e) => this.updateInput(e)} type="number" className="form-control" placeholder="weight (in kg)" name="weight"/>
          <input ref="height" onChange={(e) => this.updateInput(e)} type="number" className="form-control" placeholder="height (in meters)" name="height"/>
          <input ref="image" onChange={(e) => this.updateInput(e)} type="text" className="form-control" placeholder="image-url" name="image"/>
          <button onClick={(e) => this.handleSubmit(e)} type="submit" className="btn btn-primary">Create Dinosaur</button>
        </div>
      </form>
    )
  }
}

module.exports = DinosaurForm;
