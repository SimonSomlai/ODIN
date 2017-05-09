import React, {Component} from "react"
import ReactDOM from "react-dom"
import MovieStore from "../../stores/MovieStore.js"
import MovieActions from "../../actions/MovieActions.js"
import helper from "../../utils/utils"

class MovieDetail extends Component {
  constructor(props) {
    super(props)
    this.state = {
      movie: {
        id: "",
        name: "",
        description: "",
        director: "",
        release_date: "",
        actors: "",
        genre: "",
        images: []
      },
      isEditing: false
    }
  }

  // Helper Functions

  handleStoreChange(){
    var movie = MovieStore.findMovie(this.props.params.id)
    this.setState({movie: movie});
  }

  toggleEditing(){
    this.setState({isEditing: !this.state.isEditing})
  }

  updateMovie(){
    console.log('this.state', this.state);
    var formFields = this.refs, isEditing = this.state.isEditing; // Grab the input from the formfields & current editing state
    for(var prop in formFields){
      if(prop === "images"){
        this.state.movie[prop] = formFields[prop].value.split(",")
      } else {
        this.state.movie[prop] = formFields[prop].value; // Change the state fields with new input values
      }
    }
    console.log(this.props.params.id)
    MovieActions.updateMovie(this.props.params.id, this.state.movie); // Trigger action, which triggers dispatcher, which updates store, which broadcasts event
    this.setState({movie: this.state.movie, isEditing: !this.state.isEditing});
  }

  // Lifecycle Functions

  componentWillMount() {
    // Add listener to the component.
    MovieStore.addChangeListener(this.handleStoreChange.bind(this));

    console.log('searching movie in store');
    var movie = MovieStore.findMovie(this.props.params.id)
    if(movie){
      console.log('movie found in store');
      this.setState({movie: movie})
    } else {
      console.log('movie not in store, getting movie from API');
      MovieActions.getMovie(this.props.params.id)
    }
  }

  componentWillUnmount(){
    // Remove the listener from the component.
    MovieStore.removeChangeListener(this.handleStoreChange.bind(this));
  }

  // Render Functions

  renderContent(){
    const {
      _id,
      name,
      actors,
      description,
      director,
      genre,
      images,
      release_date
    } = this.state.movie

    if(this.state.isEditing){
      var style = {
        width: "100%"
      }
      var style2 = {
        marginLeft: "15px"
      }

      return(
      <div className="container clearfix">
        <div className="col_full portfolio-single-image">
          <textarea className="sm-form-control" defaultValue={this.state.movie.images} ref="images"></textarea>
        </div>
        <div className="col_one_third nobottommargin">
          <div className="panel panel-default events-meta">
            <div className="panel-body">
              <ul className="portfolio-meta nobottommargin">
                <li>
                  <span><i className="icon-user"/>Director: </span><input className="sm-form-control" defaultValue={this.state.movie.director} ref="director" type="text"/></li>
                <li>
                  <span><i className="icon-calendar3"/>Released:</span><input className="sm-form-control" defaultValue={this.state.movie.release_date} ref="release_date" type="number"/></li>
                <li>
                  <span><i className="icon-lightbulb"/>Actors:</span><input className="sm-form-control"  defaultValue={this.state.movie.actors} ref="actors" type="text"/></li>
                <li>
                  <span><i className="icon-link"/>Genre: </span><input className="sm-form-control" defaultValue={this.state.movie.genre} ref="genre" type="text"/>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div className="col_two_third portfolio-single-content col_last nobottommargin">
          <div className="fancy-title title-dotted-border">
            <h2><input className="sm-form-control" defaultValue={this.state.movie.name} ref="name" type="text"/></h2>
          </div>
          <div className="col_half nobottommargin">
            <textarea ref="description" className="sm-form-control" defaultValue={this.state.movie.description} style={style}></textarea>
          </div>
        </div>
        <div className="clear"/>
        <button onClick={() => this.updateMovie()} className="button button-3d nomargin button-green" id="template-contactform-submit" name="template-contactform-submit" value="submit">Save</button>
        <button style={style2} onClick={() => this.toggleEditing()} className="button button-3d button-grey" id="template-contactform-submit" name="template-contactform-submit" value="submit">Cancel</button>

      </div>)
    } else {
      return(
      <div className="container clearfix">
        <div className="col_full portfolio-single-image">
          <img src={images[1]} alt/>
        </div>
        <div className="col_one_third nobottommargin">
          <div className="panel panel-default events-meta">
            <div className="panel-body">
              <ul className="portfolio-meta nobottommargin">
                <li>
                  <span><i className="icon-user"/>Director:</span>{director}</li>
                <li>
                  <span><i className="icon-calendar3"/>Released:</span>{release_date}</li>
                <li>
                  <span><i className="icon-lightbulb"/>Actors:</span>{actors}</li>
                <li>
                  <span><i className="icon-link"/>Genre:</span>
                  <a href="#">{genre}</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div className="col_two_third portfolio-single-content col_last nobottommargin">
          <div className="fancy-title title-dotted-border">
            <h2>{helper.capitalizeFirstLetter(name)}</h2>
          </div>
          <div className="col_half nobottommargin">
            <p>{description}</p>
          </div>
        </div>
        <div className="clear"/>
        <button onClick={() => this.toggleEditing()} className="button button-3d nomargin button-blue" id="template-contactform-submit" name="template-contactform-submit" value="submit">Edit Movie</button>
      </div>)
    }
  }

  render() {
    return (
      <section id="content">
        <div className="content-wrap">
          {this.renderContent()}
        </div>
      </section>
    )
  }

}

export default MovieDetail;
