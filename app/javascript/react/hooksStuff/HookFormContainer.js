import React, {useState, useEffect} from 'react'
// import GameTile from '../components/GameTile'
import HookTile from './HookTile'
import DualSidedPicks from './DualSidedPicks'

const HookFormContainer = (props) => {

  let [games, setGames] = useState([])
  let [picks, setPicks] = useState([])
  let [editFlag, setEditFlag] = useState(false)
  let [mainSlate, setMainSlate] = useState(null)
  let [noGames,setNoGames] = useState(false)
  let [errors,setErrors] = useState("")
  let [availableConfidenceScores, setAvailableConfidenceScores] = useState([])

  let leagueID = props.match.params.id
  useEffect(() => {
    fetch(`/api/v1/leagues/${leagueID}/picks`, {credentials: 'same-origin'})
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {

      let mainSlateStart = Date.parse(body.main)
      if( body.picks.length >0 )
      {setEditFlag(true)}

      setGames(body.games)
      setPicks(body.picks)
      setMainSlate(mainSlateStart)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  },[])

  const validatePick = (pick) => {
    if (pick.winning_team > 0){
      if (pick.confidence > 0) {
        let game
        game = games.filter(game => game.id === pick.game_id)
        if (Date.parse(game[0].gametime) < Date.now()) {
          return pick
        }
        else {
          return "Game has already started"
        }
      }
    }
  }

  const handleSelectWinner =(winner,confidence,gameId, pickId=0) => {
    let winnerId = winner
    let confidenceScore = confidence
    let pickedgameId = gameId
    setPicks (picks.filter(pick => pick.game_id != pickedgameId ))
    let pick = [{id: pickId, winning_team:winnerId, confidence:confidenceScore,game_id:pickedgameId }]
    let newPicks = picks.concat(pick)
    setPicks(newPicks)
  }

  const handleConfidenceAssignment = (score, originalScore, gameId, winningTeam =0, pickId=0) => {
    let pickedgameId = gameId
    let newAvailableScores = availableConfidenceScores.filter(eachScore => eachScore != score)
    if (originalScore) {
      let compareNumbers = (a,b) => {
        return a-b
      }
      newAvailableScores.splice(originalScore,0, originalScore)
      newAvailableScores.sort(compareNumbers)
    }
    let winnerId
    if (winningTeam !=0) {
      winnerId = winningTeam
    }
    let picks = picks.filter(pick => pick.game_id != pickedgameId )
    let pick = [{id: pickId, winning_team:winnerId, confidence:score, game_id:pickedgameId}]
    let newPicks = picks.concat(pick)
    setAvailableConfidenceScores(newAvailableScores)

    setPicks(newPicks)
  }

  const findPick = (game) => {
    let pick
    let gamePick
    pick = picks.filter(pick => pick.game_id === game.id)
    if (pick.length > 0 ) {
      return pick[0]
    } else {
      return{id:0, confidence:0, winning_team:0}
    }
  }

  const formSubmission = (event) => {
    event.preventDefault()
    let picks = picks
    let submittedPicks = picks.filter(pick => validatePick(pick))
    let formPayload = {
      leagueID: leagueID,
      picks:submittedPicks,
      timeSubmitted: Date()
    }
    if (Date.parse(formPayload.timeSubmitted) < mainSlate) {
      submitPicks(formPayload)
    }
    else {
      alert("The main slate has already started. You can no longer submit picks. Please contact your comissioner")
      location.href=`/leagues/${leagueID}`
    }
  }

  const submitPicks = (formPayload) => {
    let leagueID = leagueID
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
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {
      setPicks(body.picks)
      setErrors(body.errors)
      if (body.errors) {
          alert(body.errors)
          location.href=`/leagues/${leagueID}`
      } else {
      alert("Picks submitted successfully")
      location.href=`/leagues/${leagueID}`
    }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  let gamePick
  const gameTiles = games.map((game) => {
    gamePick = findPick(game)
    let dateTime = Date.parse(game.gametime)
    let gameTime = new Date(dateTime)
    return(
      <HookTile
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
      handleSelectWinner={handleSelectWinner}
      confidenceScore={gamePick.confidence}
      selectedWinner={gamePick.winning_team}
      availableConfidenceScores={availableConfidenceScores}
      handleConfidenceAssignment={handleConfidenceAssignment}
      gametime={gameTime}
      />

    )
  })
  return(
    <div className="row">
    <form className="small-12 columns fieldBackgroundForm" onSubmit={formSubmission}>
    <DualSidedPicks
      games={games}
    />
    <input type="submit" value="Submit" className="submitButton" />
    </form>
    </div>
  )
}
export default HookFormContainer
