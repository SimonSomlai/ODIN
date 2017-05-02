class Records extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      records: this.props.data
    }
  }

  allAmounts() {
    return this.state.records.map((record) => {
      return parseInt(record.amount)
    })
  }

  componentWillMount() {
    this.eventEmitter = new EventEmitter()
    this.eventEmitter.addListener("createRecord", (record) => {
      this.createRecord(record)
    })
    this.eventEmitter.addListener("deleteRecord", (index) => {
      this.deleteRecord(index)
    })
    this.eventEmitter.addListener("updateRecord", (object) => {
      this.updateRecord(object)
    })
  }

  createRecord(record) {
    this.state.records.push(record)
    this.setState({records: this.state.records})
  }

  findRecord(obj) {
    return Fetch.postJSON("find-record", {record: obj}).then((response) => {
      return response
    }).catch(function(error) {
      console.log("error")
    });
  }

  updateRecord(object) {
    var index = object.index
    delete object.index
    var record = this.state.records[index]
    var oldRecord = this.state.records[index]
    this.state.records[index] = object
    var response = this.findRecord(oldRecord)
    this.setState({records: this.state.records})
    response.then((result) => {
      return result.id
    }).then((recordId) => {
      var params = $.param({record: object})
      return fetch("http://localhost:3000/records/" + recordId + "?" + params, {method: "PATCH"}).then((response) => {
        console.log(response)
      }).catch(function(error) {
        console.log("error")
      });
    })
  }

  deleteRecord(index) {
    var record = this.state.records[index]
    this.state.records.splice(index, 1)
    this.setState({records: this.state.records})
    var response = this.findRecord(record)
    response.then((result) => {
      return result.id
    }).then((recordId) => {
      var headers = new Headers();
      fetch("http://localhost:3000/records/" + recordId, {method: 'delete'}).then((response) => {
        console.log(response)
      }).catch(function(error) {
        console.log("error")
      });
    })
  }

  renderRecords() {
    var records = []
    for (var i = 0; i < this.state.records.length; i++) {
      records.push(<Record eventEmitter={this.eventEmitter} index={i} key={i} id={this.state.records[i].id} amount={this.state.records[i].amount} date={this.state.records[i].date} title={this.state.records[i].title}/>)
    }
    return records
  }

  renderDisplays() {
    var displays = [],
      displayNames = [
        "inkomsten", "uitgaven", "balans"
      ],
      amounts = this.allAmounts()
    for (var i = 0; i < displayNames.length; i++) {
      displays.push(<DisplayBox key={displayNames[i]} name={displayNames[i]} amounts={amounts}/>)
    }
    return displays
  }

  render() {
    return (
      <div className="records">
        <div className="row">
          <div className="col-md-8 col-md-offset-2">
            <h2 className="title">Records</h2>
            {this.renderDisplays()}
            <RecordForm eventEmitter={this.eventEmitter}/>
            <table className="table">
              <thead>
                <tr>
                  <td>Index</td>
                  <td>Date</td>
                  <td>Title</td>
                  <td>Amount</td>
                  <td>Actions</td>
                </tr>
              </thead>
              <tbody>
                {this.renderRecords()}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    )
  }
}
