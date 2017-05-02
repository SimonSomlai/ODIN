class RecordForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      title: "",
      date: "",
      amount: ""
    }
  }

  updateInput(e) {
    name = e.target.name
    this.setState({[name]: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault();
    Fetch.postJSON("", {record: this.state})
    .then(function(response) {
      console.log("success")
    })
    .then((data) => {
      this.props.eventEmitter.emit("createRecord", this.state)
    })
    .catch(function(error) {
      console.log("error")
    });
  }

  valid() {
    inputs = [this.state.title, this.state.date, this.state.amount]
    if (inputs.indexOf("") == -1) {
      return true
    }
    return false
  }
  render() {
    return (
      <form className="form-inline" onSubmit={(e) => handleSubmit(e)}>
        <div className="form-group">
          <input onChange={(e) => this.updateInput(e)} type="text" className="form-control" placeholder="date" name="date"/>
          <input onChange={(e) => this.updateInput(e)} type="text" className="form-control" placeholder="title" name="title"/>
          <input onChange={(e) => this.updateInput(e)} type="number" className="form-control" placeholder="amount" name="amount"/>
          <button onClick={(e) => this.handleSubmit(e)} type="submit" className="btn btn-primary" disabled={!this.valid()}>Create Record</button>
        </div>
      </form>
    )
  }
};
