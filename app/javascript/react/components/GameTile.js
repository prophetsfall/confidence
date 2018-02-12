import React, {Component} from 'react';

class GameTile extends Component {
  constructor(props) {
    super(props);
    this.state={
      score:0,
      winner:0
    }
    this.handleWinner = this.handleWinner.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleWinner(event){
    // this.props.handleSelectWinner(event,this.props.gameId)
    let winner = parseInt(event.target.id)
    let confidence
    let gameId = this.props.gameId
    console.log(this.state.winner)
    if (this.state.score != 0) {
      confidence = this.state.score
    }
    this.props.handleSelectWinner(winner,confidence,gameId )
    this.setState({winner:winner})
  }

  handleChange(event){
    let originalScore;
    let winningTeam;
    let score = parseInt(event.target.value);
    let gameId = this.props.gameId
    if (this.state.score != 0) {
      originalScore = this.state.score
    }
    if (this.state.winner !=0) {
      winningTeam = this.state.winner
    }
    this.props.handleConfidenceAssignment(score, originalScore, gameId, winningTeam)
    this.setState({score:score})
  }



  render(){
    let currentSelection= this.state.score

    let gameDisplay;
    if (this.state.winner != 0) {
      if (this.state.winner === this.props.awayTeamId) {
        gameDisplay =
        <div>
          <p
            className="awayTeamwinner"
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
        </div>
      } else {
        gameDisplay =
        <div>
          <p
            className="awayTeam"
            id={this.props.awayTeamId}
            onClick={this.handleWinner}>
            {this.props.awayTeamLocation} {this.props.awayTeamName}
          </p>
          <span>AT</span>
          <p
            className="homeTeamwinner"
            id={this.props.homeTeamId}
            onClick={this.handleWinner}>
            {this.props.homeTeamLocation} {this.props.homeTeamName}
          </p>
        </div>
      }
    } else {
      gameDisplay =
      <div>
        <p
          className="awayTeam"
          id={this.props.awayTeamId}
          onClick={this.handleWinner}
          >
            {this.props.awayTeamLocation} {this.props.awayTeamName}
          </p>
          <span>AT</span>
          <p
            className="homeTeam"
            id={this.props.homeTeamId}
            onClick={this.handleWinner}
            >
              {this.props.homeTeamLocation} {this.props.homeTeamName}
            </p>
          </div>
        }


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
                  {gameDisplay}
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
