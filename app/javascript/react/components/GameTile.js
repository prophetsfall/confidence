import React, {Component} from 'react';

class GameTile extends Component {
  constructor(props) {
    super(props);
    this.state={
      score:0
    }
    this.handleWinner = this.handleWinner.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleWinner(event){
    this.props.handleSelectWinner(event,this.props.gameId)
  }

  handleChange(event){
    let originalScore;
    if (this.state.score != 0) {
      originalScore = this.state.score
    }
    this.setState({score:parseInt(event.target.value)})
    this.props.handleConfidenceAssignment(event, originalScore)
  }



render(){
  let currentSelection= this.state.score
  let scoreList = this.props.availableConfidenceScores.map((score) => {
    return (
      <option
        key={`${this.props.gameId}-${score}`}
        className="dropDownOption"value={score}>{score}
      </option>)
  })
  return(
    <div>
      <form className="gameForm">
        <div className="gameTile">
          <p
            className="awayTeam"
            id={this.props.awayTeamId}
            onClick={this.handleWinner}>
            {this.props.awayTeamLocation} {this.props.awayTeamName}
          </p>
          <span>AT</span>
          <p
            className="homeTeam"
            id={this.props.homeTeamId}
            onClick={this.handleWinner}>
            {this.props.homeTeamLocation} {this.props.homeTeamName}
          </p>
          <span>Confidence Score</span>
          <select value={this.state.value} onChange={this.handleChange}>
            <option
              className="dropDownOption"
              value ={currentSelection}>
              {currentSelection}
            </option>
            {scoreList}
          </select>
        </div>
      </form>
    </div>
  )}
}


export default GameTile
