class Record extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      isEditing: false
    }
  }

  deleteRecord(index){
    this.props.eventEmitter.emit("deleteRecord", index)
  }

  changeEditingState(){
    this.setState({isEditing: !this.state.isEditing})
  }

  updateRecord(index){
    var newAttributes = {index: index}
    for(prop in this.refs){
      newAttributes[prop] = this.refs[prop].value
    }
    this.props.eventEmitter.emit("updateRecord",newAttributes)
    this.changeEditingState()
  }

  renderRows(){
    if(this.state.isEditing){
      return(
        [<td key="date"><input defaultValue={this.props.date} ref="date" type="text"/></td>,
        <td key="title"><input defaultValue={this.props.title} ref="title" type="text"/></td>,
        <td key="amount"><input defaultValue={this.props.amount} ref="amount" type="number"/></td>,
        <td key="buttons"><button onClick={() => this.updateRecord(this.props.index)} className="btn btn-primary">Save</button> | <button onClick={() => this.changeEditingState()} className="btn btn-danger">Cancel</button>
      </td>])
    } else {
      return(
      [ <td key="date">{this.props.date}</td>,
        <td key="title">{this.props.title}</td>,
        <td key="amount">{amountFormat(this.props.amount)}</td>,
        <td key="buttons"><button onClick={() => this.changeEditingState()} className="btn btn-primary">Edit</button> | <button onClick={() => this.deleteRecord(this.props.index)} className="btn btn-danger">Delete</button>
</td>])
    }
  }

    render() {
    return (<tr>
      <td>{this.props.index + 1}</td>
      {this.renderRows()}
    </tr>)
  }
};
