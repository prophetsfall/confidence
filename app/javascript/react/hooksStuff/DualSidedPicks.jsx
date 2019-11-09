import React, {useState, useEffect} from 'react'
// import HookTile from './HookTile'
import DualHookTile from './DualHookTile'
const DualSidedPicks = (props) => {
  let gameTiles

  if (props.games.length > 0){
    gameTiles = props.games.map((game) => {
    let dateTime = Date.parse(game.gametime)
    let gameTime = new Date(dateTime)
    return(
      <DualHookTile
      key={game.id}
      gameId={game.id}
      homeTeamName={game.home_team_name}
      awayTeamName={game.away_team_name}
      homeTeamId={game.home_team_id}
      awayTeamId={game.away_team_id}
      homeTeamLocation={game.home_team_location}
      awayTeamLocation={game.away_team_location}
      winningTeam={game.winning_team}
      handleSelectWinner={props.handleSelectWinner}
      availableConfidenceScores={props.availableConfidenceScores}
      handleConfidenceAssignment={props.handleConfidenceAssignment}
      gametime={gameTime}
      />

    )
  })
} else {

  gameTiles = <div> No Games</div>
}

  return(
    <>
      <h1>THIS IS GONNA BE BOSS</h1>
      <div> Hey </div>
      <div className="row">
        <div className="columns small-6">
          {gameTiles}
        </div>
        <div className="columns small-6">hello
        </div>
      </div>
    </>

  )
}

export default DualSidedPicks
