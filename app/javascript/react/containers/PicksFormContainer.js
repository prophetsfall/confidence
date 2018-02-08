import React, { Component } from 'react';
import GameTile from '../components/GameTile'

class PicksFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      leagueID:0,
      games: [],
      availableConfidenceScores: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],
      picks:[]
    }
    this.handleSelectWinner = this.handleSelectWinner.bind(this)
    this.handleConfidenceAssignment = this.handleConfidenceAssignment.bind(this)
  }

  componentDidMount() {
    let leagueID = this.props.params.id;
    fetch(`/api/v1/picks`, {credentials: 'same-origin'})
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({leagueID: leagueID, games: body.games})
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleSelectWinner(event, gameId){
    event.preventDefault()
    let winnerId = event.target.id
    let winners = this.state.winners
  }

  handleConfidenceAssignment(event, originalScore){
    let score = parseInt(event.target.value);
    let availableConfidenceScores = this.state.availableConfidenceScores
    let newAvailableScores = availableConfidenceScores.filter(eachScore => eachScore != score)
    if (originalScore) {
      let compareNumbers = (a,b) => {
        return a-b;
      }
      newAvailableScores.splice(originalScore,0, originalScore)
      newAvailableScores.sort(compareNumbers)
      }
    this.setState({availableConfidenceScores:newAvailableScores})
  }


  render(){
    let games = this.state.games.map((game) => {
      return(
        <GameTile
          key={game.id}
          gameId={game.id}
          homeTeamName={game.home_team_name}
          awayTeamName={game.away_team_name}
          homeTeamId={game.home_team_id}
          awayTeamId={game.away_team_id}
          homeTeamLocation={game.home_team_location}
          awayTeamLocation={game.away_team_location}
          winningTeam={game.winningTeam}
          handleSelectWinner={this.handleSelectWinner}
          confidenceScore={null}
          availableConfidenceScores={this.state.availableConfidenceScores}
          handleConfidenceAssignment={this.handleConfidenceAssignment}
        />

      )
    })

    return(
      <form onSubmit={this.handleSubmit}>
        <div className="PicksFormContainer">
          hi from picks container
          {games}
          <input type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}
export default PicksFormContainer
