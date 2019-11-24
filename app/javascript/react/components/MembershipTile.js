import React from 'react'
import { Redirect } from "react-router-dom"

const MembershipTile = props => {
  return(
    <div className="button" onClick={props.redirector} id={props.leagueId}>
      {props.leagueName}
    </div>
  )
}

export default MembershipTile
