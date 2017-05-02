import React, {Component} from "react"
import _ from "lodash"

class ToDoListItem extends Component {
  constructor(props){
    super(props)
    this.state = {
      isEditing: false,
    }
  }

  toggleEditingMode(){
    this.setState({isEditing: !this.state.isEditing})
  }

  toggleStatus(){
    this.props.eventEmitter.emit("toggleStatus", this.props.title)
  }

  updateItem(e){
    e.preventDefault()
    this.props.eventEmitter.emit("updateItem", {oldTaskTitle: this.props.title, newTaskTitle: this.refs.input.value})
    this.toggleEditingMode()
  }

  renderStyle(){
    return (this.props.status ? "green" : "red")
  }

  deleteItem(){
    this.props.eventEmitter.emit("deleteItem", this.props.title)
  }

  renderButtons(){
    if(this.state.isEditing) {
      return[
        <td>
          <form onSubmit={(e) => this.updateItem(e)}>
          <input type="text" defaultValue={this.props.title} ref="input"/>
          </form>
        </td>,
        <td>{this.props.status.toString()}</td>,
        <td>
        <a onClick={(e) => this.updateItem(e)} className="btn btn-primary">Save</a> | <a onClick={() => this.toggleEditingMode()} className="btn btn-danger">Cancel</a>
      </td>]
    } else {
      return[
        <td onClick={() => this.toggleStatus()} className={this.renderStyle()}>{this.props.title}</td>,
        <td>{this.props.status.toString()}
        </td>,
        <td><a onClick={() => this.toggleEditingMode()} className="btn btn-primary">Edit</a> | <a onClick={(e) => this.deleteItem(e)} className="btn btn-danger">Delete</a>
      </td>  ]
    }
  }

  render() {
    return (
      <tr className="item">
        {this.renderButtons()}
      </tr>
    )
  }
}

module.exports = ToDoListItem
