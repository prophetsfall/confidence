import React, {useState, useEffect} from 'react'

const HookFormContainer = (props) => {

  let [games, setGames] = useState(null)

  let leagueID = props.match.params.id

  useEffect(() => {
    fetch(`/api/v1/leagues/${leagueID}/picks`, {credentials: 'same-origin'})
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage)
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      let mainSlateStart = Date.parse(body.main)
        // let editFlag = false
        // if( body.picks.length >0 )
        // {editFlag = true}
        debugger
        setGames(body.games)
        console.log(mainSlateStart)
        console.log(games)
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  },[])

  return(
    <h1>Hi</h1>
  )
}

export default HookFormContainer
