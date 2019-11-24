import React, {useState, useEffect} from 'react'
import { Link, Redirect } from "react-router-dom"
import MembershipTile from '../components/MembershipTile'

const MembershipsContainer = (props) =>{
  const [memberships, setMemberships] = useState([])
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [selectedLeague, setSelectedLeague] = useState(null)

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
      })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  },[])

  const selectMembership = (event) => {
    event.preventDefault
    let leagueId = event.currentTarget.id
    memberships.find(membership => leagueId === membership.id)
    setSelectedLeague(leagueId)
    setShouldRedirect(true)
  }


  const membershipsMap = memberships.map((membership) => {
    return(
      <MembershipTile
        key={membership.id}
        id={membership.id}
        leagueName={membership.league_name}
        leagueId={membership.league_id}
        redirector={selectMembership}
      />
    )
  })

  if (shouldRedirect) {
    return <Redirect to={`/leagues/${selectedLeague}`}/>
  } else {

  return(
    <>
    <h1>This is a Membership HookFormContainer</h1>
    <div>{membershipsMap}</div>
    </>
  )}
}

export default MembershipsContainer
