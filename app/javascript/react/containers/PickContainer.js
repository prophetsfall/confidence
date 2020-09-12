import React, {useEffect, useState} from 'react'

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
    leagueId = 2
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
        setLeagueId(leagueID)
        setPicks(body.picks)
        setAvailableScores(body.availableScores)
        setGames(body.games)
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }, [])

  debugger

  return(
    <>
      Yes this is a pick thing
    </>
  )
}

export default PickContainer
