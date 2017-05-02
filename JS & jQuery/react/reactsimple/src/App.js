import React, {Component} from 'react';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      PLAYER1: "X",
      PLAYER2: "O",
      currentTurn: "X",
      board: [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
      ]
    }
  }

  handleClick(index){
    this.state.board[index] = this.state.currentTurn
    this.setState({
      board: this.state.board,
      currentTurn: this.state.currentTurn === "X" ? this.state.currentTurn = "O" : this.state.currentTurn = "X"
    })
  }

  render() {
    return (
      <div className="board">
        {this.state.board.map((cell, index) => {
          return <div onClick={() => {this.handleClick(index)}} data-cell-id={index} className="square">{cell}</div>;
        })}
      </div>
    )
  }
}

export default App;
