import React, {Component} from "react"

class CreateToDo extends Component {
  createItem(e){
    e.preventDefault()
    this.props.eventEmitter.emit("createItem", this.refs.todo.value)
    this.refs.todo.value = "";
  }

  render() {
    return (
      <form onSubmit={(e) => this.createItem(e)}>
        <input ref="todo" type="text" placeholder="type your todo here"/>
        <button type="submit">Create To Do </button>
      </form>
    )
  }
}

module.exports = CreateToDo
