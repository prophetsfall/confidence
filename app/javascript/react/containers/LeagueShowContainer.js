import React, { useState, useEffect } from 'react'

const LeagueShowContainer = props => {
  const [league, setLeague]  = useState(null)

  useEffect(() => {
    let leagueId = props.match.params.id
    fetch(`/api/v1/leagues/${leagueId}`, {credentials: 'same-origin'})
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
      setLeague(body.memberships)
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  },[])

  return(
    <h1>This is a league show</h1>
  )
}
export default LeagueShowContainer
