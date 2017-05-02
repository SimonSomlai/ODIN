import React, {Component} from "react"
import ToDoListHeader from "./to_do_list_header"
import ToDoListItem from "./to_do_list_item"
import CreateToDo from "./create_to_do"
import _ from "lodash"
import {EventEmitter} from "events"

const todos = [
  {
    title: "Get some milk",
    status: false
  }, {
    title: "Dominate world",
    status: false
  }
]

class ToDoList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      todos: todos
    }
  }

  updateState(state){
    this.setState(state)
  }

  componentWillMount(){
    this.eventEmitter = new EventEmitter()
    this.eventEmitter.addListener("createItem",(task) => {
      this.createItem(task)
    })
    this.eventEmitter.addListener("updateItem",(object) => {
      this.updateItem(object)
    })
    this.eventEmitter.addListener("deleteItem",(task) => {
      this.deleteItem(task)
    })
    this.eventEmitter.addListener("toggleStatus",(task) => {
      this.toggleStatus(task)
    })
  }

  createItem(task){
    this.state.todos.push({
      title: task,
      status: false
    })
    this.updateState({todos: todos})
  }

  updateItem(object){
    var found = _.find(this.state.todos, (todo) => {
      return (todo.title == object.oldTaskTitle)
    })
    found.title = object.newTaskTitle
    this.updateState({todos: this.state.todos})
  }

  deleteItem(task){
    var found = _.find(this.state.todos, (todo) => {
      return (todo.title == task)
    })
    console.log(task, found, this.state.todos.length, this.state.todos.indexOf(found))
    this.state.todos.splice(this.state.todos.indexOf(found),1)
    this.updateState({todos: this.state.todos})
  }

  toggleStatus(task){
    var found = _.find(this.state.todos, (todo) => {
      return (todo.title == task)
    })

    found.status = !found.status
    this.updateState({todos: this.state.todos})
  }


  renderItems() {
    var todos = []
    _.each(this.state.todos, (todo, index) => {
      todos.push(
        <ToDoListItem eventEmitter={this.eventEmitter} key={index} status={todo.status} title={todo.title}/>
      )
    })
    return todos
  }

  render() {
    return (
      <div className="col-md-8 col-md-offset-2">
        <h1>To Do List</h1>
        <CreateToDo eventEmitter={this.eventEmitter} />
        <table className="table">
          <ToDoListHeader/>
          {this.renderItems()}
        </table>
      </div>
    )
  }
}

module.exports = ToDoList
