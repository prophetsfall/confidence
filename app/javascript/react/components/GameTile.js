import React from 'react';

const GameTile = (props) => {

  return(
    <div className="gameTile">
      <p className="awayTeam">{props.awayTeamLocation} {props.awayTeamName}</p>
      <span>AT</span>
      <p className="homeTeam">{props.homeTeamLocation} {props.homeTeamName}</p>
    </div>
  )
}


export default GameTile
