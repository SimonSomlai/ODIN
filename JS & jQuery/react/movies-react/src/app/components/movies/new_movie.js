import React, {Component} from "react"
import ReactDOM from "react-dom"
import MovieActions from "../../actions/MovieActions.js"

class NewMovie extends Component {
  constructor(props){
    super(props);
    this.state = {
      name: "",
      description: "",
      director: "",
      release_date: "",
      actors: "",
      genre: "",
      images: ""
    }
  }

  updateInput(e){
    if (e.target.name === "images"){
      this.setState({[e.target.name]: e.target.value.split(",")});
    } else {
      this.setState({[e.target.name]: e.target.value});
    }
  }

  handleSubmit(e){
    e.preventDefault()
    var formFields = this.refs
    // Clear fields with loop
    for(var prop in formFields){
      formFields[prop].value = ""
    }
    MovieActions.createMovie(this.state);
    window.location = "http://localhost:3001/"
  }

  render() {
    return (
      <div className="col-md-8 col-md-offset-2">
        <form onSubmit={(e) => this.handleSubmit(e)} className="nobottommargin topmargin" id="template-contactform" name="template-contactform">
          <div className="col_full">
            <label htmlFor="template-contactform-name">Title</label>
            <input  onChange={(e) => this.updateInput(e)} ref="name" type="text" id="template-contactform-name" name="name" className="sm-form-control required" aria-required="true"/>
          </div>
          <div className="col_full">
            <label htmlFor="template-contactform-description">Description</label>
            <textarea  onChange={(e) => this.updateInput(e)} ref="description" className="required sm-form-control" id="template-contactform-description" name="description" rows={6} cols={30} aria-required="true" defaultValue={""}/>
          </div>
          <div className="clear"/>
          <div className="col_full">
            <label htmlFor="template-contactform-service">Genre</label>
            <select  onChange={(e) => this.updateInput(e)} ref="genre" id="template-contactform-service" name="genre" className="sm-form-control">
              <option value>-- Select One --</option>
              <option value="action">Action</option>
              <option value="adventure">Adventure</option>
              <option value="romantic comedy">Romantic Comedy</option>
              <option value="horror">Horror</option>
            </select>
          </div>
          <div className="clear"/>
          <div className="col_full">
            <label htmlFor="template-contactform-release">Release Year
              <small>*</small>
            </label>
            <input  onChange={(e) => this.updateInput(e)} ref="release_date" type="number" id="template-contactform-release" name="release_date" className="required sm-form-control" aria-required="true"/>
          </div>
          <div className="col_full">
            <label htmlFor="template-contactform-actors">Actors (seperated by comma)</label>
            <input  onChange={(e) => this.updateInput(e)} ref="actors" type="text" id="template-contactform-actors" name="actors" className="sm-form-control"/>
          </div>
          <div className="col_full">
            <label htmlFor="template-contactform-director">Director</label>
            <input  onChange={(e) => this.updateInput(e)} ref="director" type="text" id="template-contactform-director" name="director" className="sm-form-control"/>
          </div>
          <div className="col_full">
            <label htmlFor="template-contactform-images">3 Images (seperated by comma)</label>
            <textarea  onChange={(e) => this.updateInput(e)}  ref="images "className="required sm-form-control" id="template-contactform-images" name="images" rows={6} cols={30} aria-required="true" defaultValue={""}/>
          </div>
          <div className="col_full">
            <button className="button button-3d nomargin" type="submit" id="template-contactform-submit" name="template-contactform-submit" value="submit">Create Movie</button>
          </div>
        </form>
      </div>
    )
  }
}

export default NewMovie;
