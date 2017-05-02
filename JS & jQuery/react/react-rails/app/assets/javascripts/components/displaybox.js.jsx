class DisplayBox extends React.Component {
  panelClass() {
    switch (this.props.name) {
      case "inkomsten":
        return "panel-success"
        break;
      case "uitgaven":
        return "panel-danger"
        break;
      case "balans":
        return "panel-primary"
        break;
      default:
    }
  }

  panelAmount() {
    var amounts = this.props.amounts
    switch (this.props.name) {
      case "inkomsten":
        return amounts.filter((element) => {
          return element >= 0;
        }).reduce((a, b) => a + b, 0);
        break;
      case "uitgaven":
        return amounts.filter((element) => {
          return element < 0;
        }).reduce((a, b) => a + b, 0);
        break;
      case "balans":
        return amounts.reduce((a, b) => a + b, 0);
        break;
      default:
    }
  }

  render() {
    return (
      <div className="col-md-4">
        <div className={"panel panel-default " + this.panelClass()}>
          <div className="panel-heading">{this.props.name}</div>
          <div className="panel-body">{amountFormat(this.panelAmount())}</div>
        </div>
      </div>
    )
  }
};
