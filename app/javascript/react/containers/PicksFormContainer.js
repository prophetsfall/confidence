import React, { Component } from 'react';
import GameTile from '../components/GameTile'

class PicksFormContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      leagueID:0,
      games: [],
      availableConfidenceScores: [],
      picks:[],
      editFlag: false,
      noGames: false
    }
    this.handleSelectWinner = this.handleSelectWinner.bind(this)
    this.handleConfidenceAssignment = this.handleConfidenceAssignment.bind(this)
    this.formSubmission = this.formSubmission.bind(this)
    this.submitPicks = this.submitPicks.bind(this)
  }

  componentDidMount() {
    let leagueID = this.props.params.id;
    fetch(`/api/v1/leagues/${leagueID}/picks`, {credentials: 'same-origin'})
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
      if (body.games === "none"){
        this.setState({noGames: true})
      }
      else {
        let editFlag = false
        if( body.picks.length===body.games.length)
        {editFlag = true}
          this.setState({
          leagueID: leagueID,
          games: body.games,
          availableConfidenceScores:body.availableScores,
          picks: body.picks,
          editFlag: editFlag
      })
    }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  formSubmission(event) {
    event.preventDefault()
    let formPayload = {
      leagueID: this.state.leagueID,
      picks:this.state.picks
    }
    this.submitPicks(formPayload)
  }

  submitPicks(formPayload) {
    let gamesLength = this.state.games.length
    let validateScore = formPayload.picks.filter(pick => pick.confidence >0 )
    let validateWinner = formPayload.picks.filter(pick => pick.winning_team > 0 )
    if (validateWinner.length === gamesLength && validateScore.length === gamesLength){
      let leagueID = this.state.leagueID
      fetch(`/api/v1/leagues/${leagueID}/picks`, {
          credentials: 'same-origin',
          method: 'post',
          body: JSON.stringify(formPayload),
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
          }
        })
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
          this.setState({picks:body.picks})
          alert("Picks submitted successfully")
          location.href=`/leagues/${leagueID}`

      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
    }
    else {
      let errorScores;
      let errorWinners;
      if (validateScore.length < gamesLength ) {
        errorScores = "You must select a score greater than 0 for each game!"
      } else {
        errorScores=''
      }
      if (formPayload.picks.length < gamesLength || validateWinner.length < gamesLength ) {
        errorWinners = "You must select a winner for each game!"
      }
      else {
        errorWinners=''
      }
    alert(`${errorScores}  ${errorWinners}`)
    }
  }

  handleSelectWinner(winner,confidence,gameId, pickId=0){
    let winnerId = winner
    let confidenceScore = confidence
    let pickedgameId = gameId
    let picks = this.state.picks.filter(pick => pick.game_id != pickedgameId )
    let pick = [{id: pickId, winning_team:winnerId, confidence:confidenceScore,game_id:pickedgameId }]
    let newPicks = picks.concat(pick)
    this.setState({ picks:newPicks})
  }

  handleConfidenceAssignment(score, originalScore, gameId, winningTeam =0, pickId=0){
    let pickedgameId = gameId
    let availableConfidenceScores = this.state.availableConfidenceScores
    let newAvailableScores = availableConfidenceScores.filter(eachScore => eachScore != score)
    if (originalScore) {
      let compareNumbers = (a,b) => {
        return a-b;
      }
      newAvailableScores.splice(originalScore,0, originalScore)
      newAvailableScores.sort(compareNumbers)
    }
    let winnerId
    if (winningTeam !=0) {
      winnerId = winningTeam
    }
    let picks = this.state.picks.filter(pick => pick.game_id != pickedgameId )
    let pick = [{id: pickId, winning_team:winnerId, confidence:score, game_id:pickedgameId}]
    let newPicks = picks.concat(pick)
    this.setState({availableConfidenceScores:newAvailableScores, picks:newPicks})
  }


  render(){
    let games;
    if (this.state.editFlag == true) {
      games = this.state.games.map((game) => {
        let gamePick = this.state.picks.find((pick) =>
        (pick.game_id === game.id )
      )
      return(
        <GameTile
          key={game.id}
          gameId={game.id}
          pickId={gamePick.id}
          homeTeamName={game.home_team_name}
          awayTeamName={game.away_team_name}
          homeTeamId={game.home_team_id}
          awayTeamId={game.away_team_id}
          homeTeamLocation={game.home_team_location}
          awayTeamLocation={game.away_team_location}
          winningTeam={game.winning_team}
          handleSelectWinner={this.handleSelectWinner}
          confidenceScore={gamePick.confidence}
          selectedWinner={gamePick.winning_team}
          availableConfidenceScores={this.state.availableConfidenceScores}
          handleConfidenceAssignment={this.handleConfidenceAssignment}
        />

      )
    }, this)
  } else {
    games = this.state.games.map((game) => {
      return(
        <GameTile
          key={game.id}
          gameId={game.id}
          pickId={0}
          homeTeamName={game.home_team_name}
          awayTeamName={game.away_team_name}
          homeTeamId={game.home_team_id}
          awayTeamId={game.away_team_id}
          homeTeamLocation={game.home_team_location}
          awayTeamLocation={game.away_team_location}
          winningTeam={game.winningTeam}
          handleSelectWinner={this.handleSelectWinner}
          selectedWinner={0}
          confidenceScore={0}
          availableConfidenceScores={this.state.availableConfidenceScores}
          handleConfidenceAssignment={this.handleConfidenceAssignment}
        />
      )
  })
}


    return(
      <div className="row fieldBackground">
      <form className="small-12 columns" onSubmit={this.formSubmission}>
        <div className="small-12 columns pickForm">
          {games}
        </div>
        <input type="submit" value="Submit" className="submitButton" />
      </form>
    </div>
    )
  }
}
export default PicksFormContainer
