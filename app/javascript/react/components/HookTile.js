import React, {useState} from 'react';

const HookTile = (props) => {
  let [score, setScore] = useState(props.confidenceScore)
  let [pickId, setPickId] = useState(props.pickId)
  let [winner, setWinner] = useState(props.selectedWinner)
  let [gameId, setGameId] = useState(props.confidenceScore)

  const handleWinner = (event) => {
    let winner = parseInt(event.currentTarget.id)
    props.handleSelectWinner(winner,score,gameId,pickId)
    setWinner(winner)
  }

  const handleChange = (event) => {
    let originalScore;
    let winningTeam;
    setScore(parseInt(event.target.value))
    if (score != 0) {
      originalScore = score
    }
    if (winner !=0) {
      winningTeam = winner
    }
    props.handleConfidenceAssignment(score, originalScore, gameId, winningTeam,pickId)
    setScore(score)
  }

    let currentSelection;
    let zeroValue;
    if (score != 0) {
      currentSelection=
      <option
        className="dropDownOption"
        value ={score}>
        {score}
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
        value ={score}>
        {score}
      </option>
    }

    let away = "awayTeam"
    let home = "homeTeam"
    if (winner != 0) {
      if (winner === props.awayTeamId) {
        away = "awayTeamwinner"
      } else {
        home = "homeTeamwinner"
      }
    }
    let gameDisplay =
    <div>
      <div onClick={handleWinner} className={away} id={props.awayTeamId} >
        <img src={assetHelper[`${props.awayTeamName}.gif`]} alt={props.awayTeamName}
          className={away} id={props.awayTeamId}
        />
        <p className={away} id={props.awayTeamId}>
          {props.awayTeamLocation} {props.awayTeamName}
        </p>
      </div>
      <span>AT</span>
      <div onClick={handleWinner} className={home} id={props.homeTeamId} >
        <img
          src={assetHelper[`${props.homeTeamName}.gif`]}
          alt={props.homeTeamName}
          className={home}
          id={props.homeTeamId}
        />
        <p className={home} id={props.homeTeamId}>
          {props.homeTeamLocation} {props.homeTeamName}
        </p>
      </div>
    </div> ;

    let scoreList;
    let availableScores = props.availableConfidenceScores
    scoreList = props.availableConfidenceScores.map((score) => {
      return (
        <option
          key={`${props.gameId}-${score}`}
          className="dropDownOption"value={score}>{score}
        </option>)
      })

      return(
        <div>
          <form className="gameForm">
            <div className="small-6 medium-4 large-3 columns end gameTile">
              {gameDisplay}
              <span className="conScore">Confidence Score</span>
              <select value={score} onChange={handleChange}>
                {currentSelection}
                {zeroValue}
                {scoreList}
              </select>
              <div className="gameTime">
                {props.gametime.toLocaleDateString()} @ {props.gametime.toLocaleTimeString()}
              </div>
            </div>
          </form>
        </div>
      )}
    export default HookTile
