import React, {useState, useEffect} from 'react'

const MembershipShowContainer = (props) => {
  const [membership, setMembership] = useState("")
  const [leagues, setLeagues] = useState([])

  let membershipId = props.match.params.id

  useEffect(() => {
    debugger
    fetch(`/api/v1/memberships/${membershipId}`, {credentials: 'same-origin'})
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
      debugger
      setMembership(body.membership)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  },[])
  return(
    <h1>This is a Show Container</h1>
  )
}

export default MembershipShowContainer
