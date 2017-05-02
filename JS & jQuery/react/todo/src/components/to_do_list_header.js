import React, {Component} from "react"

class ToDoListHeader extends Component {
  render() {
    return (
      <thead>
        <tr>
          <th>Task</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
    )
  }
}

module.exports = ToDoListHeader
