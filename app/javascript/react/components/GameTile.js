import React, {Component} from 'react';

class GameTile extends Component {
  constructor(props) {
    super(props);
    this.state={
      score:this.props.confidenceScore,
      pickId: this.props.pickId,
      winner:this.props.selectedWinner,
      gameId:this.props.gameId
    }
    this.handleWinner = this.handleWinner.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleWinner(event){
    let winner = parseInt(event.target.id)
    let gameId = this.props.gameId
    let pickId;
    if (this.state.pickId !=0) {
      pickId = this.state.pickId
    }
    let confidenceScore;
    if (this.state.score != 0) {
      confidenceScore = this.state.score
    }
    this.props.handleSelectWinner(winner,confidenceScore,gameId,pickId)
    this.setState({winner:winner})
  }

  handleChange(event){
    let originalScore;
    let winningTeam;
    let pickId;
    if (this.state.pcikId !=0) {
      pickId = this.state.pickId
    }
    let score = parseInt(event.target.value);
    let gameId = this.props.gameId
    if (this.state.score != 0) {
      originalScore = this.state.score
    }
    if (this.state.winner !=0) {
      winningTeam = this.state.winner
    }
    this.props.handleConfidenceAssignment(score, originalScore, gameId, winningTeam,pickId)
    this.setState({score:score})
  }



  render(){
    let currentSelection;
    let zeroValue;
    if (this.state.score != 0) {
      currentSelection=
      <option
        className="dropDownOption"
        value ={this.state.score}>
        {this.state.score}
      </option>
      zeroValue =
      <option
        className="dropDownOption"
        value ={0}>
        0
      </option>
    } else {
      currentSelection = <option
        className="dropDownOption"
        value ={this.state.score}>
        {this.state.score}
      </option>
    }

    let away = "awayTeam"
    let home = "homeTeam"
    if (this.state.winner != 0) {
      if (this.state.winner === this.props.awayTeamId) {
        away = "awayTeamwinner"
      } else {
        home = "homeTeamwinner"
      }
    }
    let gameDisplay =
    <div>
      <div onClick={this.handleWinner} className={away} id={this.props.awayTeamId} >
        <img src={assetHelper[`${this.props.awayTeamName}.gif`]} alt={this.props.awayTeamName}
          className={away} id={this.props.awayTeamId}
        />
        <p className={away} id={this.props.awayTeamId}>
          {this.props.awayTeamLocation} {this.props.awayTeamName}
        </p>
      </div>
      <span>AT</span>
      <div onClick={this.handleWinner} className={home} id={this.props.homeTeamId} >
        <img
          src={assetHelper[`${this.props.homeTeamName}.gif`]}
          alt={this.props.homeTeamName}
          className={home}
          id={this.props.homeTeamId}
        />
        <p className={home} id={this.props.homeTeamId}>
          {this.props.homeTeamLocation} {this.props.homeTeamName}
        </p>
      </div>
    </div> ;

    let scoreList;
    let availableScores = this.props.availableConfidenceScores
    scoreList = this.props.availableConfidenceScores.map((score) => {
      return (
        <option
          key={`${this.props.gameId}-${score}`}
          className="dropDownOption"value={score}>{score}
        </option>)
      })

      return(
        <div>
          <form className="gameForm">
            <div className="small-6 medium-4 large-3 columns end gameTile">
              {gameDisplay}
              <span className="conScore">Confidence Score</span>
              <select value={this.state.value} onChange={this.handleChange}>
                {currentSelection}
                {zeroValue}
                {scoreList}
              </select>
              <div className="gameTime">
                {this.props.gametime.toLocaleDateString()} @ {this.props.gametime.toLocaleTimeString()}
              </div>
            </div>
          </form>
        </div>
      )}
    }


    export default GameTile
