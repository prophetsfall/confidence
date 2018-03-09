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
      noGames: false,
      mainSlate: null,
      errors: ""
    }
    this.handleSelectWinner = this.handleSelectWinner.bind(this)
    this.handleConfidenceAssignment = this.handleConfidenceAssignment.bind(this)
    this.formSubmission = this.formSubmission.bind(this)
    this.submitPicks = this.submitPicks.bind(this)
    this.findPick = this.findPick.bind(this)
    this.validatePick = this.validatePick.bind(this)
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
      let mainSlateStart = Date.parse(body.main)
      if (body.games === "none"){
        this.setState({noGames: true})
      }
      else {
        let editFlag = false
        if( body.picks.length >0 )
        {editFlag = true}
        this.setState({
          leagueID: leagueID,
          games: body.games,
          availableConfidenceScores:body.availableScores,
          picks: body.picks,
          mainSlate: mainSlateStart,
          editFlag: editFlag
        })
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  validatePick(pick){
    if (pick.winning_team > 0){
      if (pick.confidence > 0) {
        let game;
        game = this.state.games.filter(game => game.id === pick.game_id)
        if (Date.parse(game[0].gametime) < Date.now()) {
          return pick
        }
        else {
          return "Game has already started"
        }
      }
    }
  }

  formSubmission(event) {
    event.preventDefault()
    let picks = this.state.picks
    let submittedPicks = picks.filter(pick => this.validatePick(pick))
    let formPayload = {
      leagueID: this.state.leagueID,
      picks:submittedPicks,
      timeSubmitted: Date()
    }
    debugger
    if (Date.parse(formPayload.timeSubmitted) < this.state.mainSlate) {
      this.submitPicks(formPayload)
    }
    else {
      alert("The main slate has already started. You can no longer submit picks. Please contact your comissioner")
      location.href=`/leagues/${leagueID}`
    }
  }

  submitPicks(formPayload) {
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
      this.setState({picks:body.picks, errors: body.errors})
      alert("Picks submitted successfully")
      location.href=`/leagues/${leagueID}`
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
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

  findPick(game) {
    let pick;
    let gamePick
    pick = this.state.picks.filter(pick => pick.game_id === game.id)
    if (pick.length > 0 ) {
      return pick[0]
    } else {
      return{id:0, confidence:0, winning_team:0}
    }
  }

  render(){
    let games;
    let gamePick
    games = this.state.games.map((game) => {
      gamePick = this.findPick(game)
      let dateTime = Date.parse(game.gametime)
      let gameTime = new Date(dateTime)
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
          gametime={gameTime}
        />

      )
    }, this)
    return(
      <div className="row">
        <form className="small-12 columns fieldBackgroundForm" onSubmit={this.formSubmission}>
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
