import React, {Component} from "react"
import ReactDOM from "react-dom"
import Dinosaur from "./dinosaur"
import DinosaurForm from "./dinosaur_form"
import DinosaurActions from "../../actions/DinosaurActions"
import DinosaurStore from "../../stores/DinosaurStore"

class DinosaurList extends Component {
  constructor(props){
    super(props);
    this.state = {
      dinosaurs: DinosaurStore.getDinosaurData()
    }
  }

  componentWillMount(){
  // Add a listener to the dinosaurstore, so when it changes handledata can be fired which eventually re-renders the component
   DinosaurStore.addChangeListener(this.handleDinosaurData.bind(this));
   DinosaurActions.getDinosaurData() // Get data from store
  }

  componentWillUnmount(){
    // Remove the listener from the component.
    DinosaurStore.removeChangeListener(this.handleDinosaurData.bind(this));
  }

  getDinosaurData(){
    DinosaurActions.getDinosaurData(); // Get data from store
  }

  handleDinosaurData(){
    var data = DinosaurStore.getDinosaurData();
    this.setState({dinosaurs: data});
  }

  renderDinosaurs(){
    var dinosaurs = this.state.dinosaurs;
    if(dinosaurs){
      var dinosaurComponents = dinosaurs.map((dinosaur) => {
        return <Dinosaur key={dinosaur.name} dinosaur={dinosaur}/>
      })
      return dinosaurComponents;
    }
  }

  render() {
    return (
      <div className="container container-dinosaur">
        <DinosaurForm/>
        <div className="rows">
          {this.renderDinosaurs()}
        </div>
      </div>
    )
  }
}

module.exports = DinosaurList
