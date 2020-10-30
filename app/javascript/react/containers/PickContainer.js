import React, {useEffect, useState} from 'react'
import PickTile from '../components/PickTile'

const PickContainer = (props) => {
  let [leagueId, setLeagueId] = useState(null)
  let [mainSlateStart, setMainSlateStart] = useState(null)
  let [picks, setPicks] = useState([])
  let [editFlag, setEditFlag] = useState(false)
  let [noGames, setNoGames] = useState(false)
  let [availableScores, setAvailableScores] = useState([])
  let [games, setGames] = useState([])
  let [errors, setErrors] = useState("")

  useEffect(() => {
    leagueId = props.match.params.id
    fetch(`/api/v1/leagues/${leagueId}/picks`, {credentials: 'same-origin'})
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
      setMainSlateStart(Date.parse(body.main))
      if (body.games === "none"){
        this.setState({noGames: true})
      }
      else {
        if( body.picks.length >0 ){
          setEditFlag(true)
        } else {
          setEditFlag(false)
        }
        setLeagueId(leagueId)
        setPicks(body.picks)
        setAvailableScores(body.availableScores)
        setGames(body.games)
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }, [])

//iterate over games to create pick tiles. Each pick tile should have its state managed by

  let pickMap = games.map(game => {
    return(
    <PickTile
      key={game.id}
      gameId={game.id}
      awayName={game.away_team_name}
      homeName={game.home_team_name}
      awayId={game.away_team_id}
      homeId={game.home_team_id}
      homeLocation={game.home_team_location}
      awayLocation={game.away_team_location}
      winnerId={game.winner_id}
     />)
  })

  return(
    <div className="row">
      <div className="columns small-12">
        {pickMap}
      </div>
    </div>
  )
}

export default PickContainer
