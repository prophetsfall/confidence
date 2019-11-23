import React, {useState, useEffect} from 'react'
import { Link } from "react-router-dom"

const MembershipsContainer = (props) =>{
  const [memberships, setMemberships] = useState([])
  const [leagues, setLeagues] = useState([])
  useEffect(() => {
    fetch(`/api/v1/memberships`, {credentials: 'same-origin'})
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
      setMemberships(body.memberships)
      setLeagues(body.leagues)
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  },[])

  const membershipsMap = memberships.map(membership => {
    return(
      <Link to={`memberships/${membership.league_id}`}>{membership.id}</Link>
    )
  })
  return(
    <>
    <h1>This is a Membership HookFormContainer</h1>
    <div>{membershipsMap}</div>
    </>
  )
}

export default MembershipsContainer
