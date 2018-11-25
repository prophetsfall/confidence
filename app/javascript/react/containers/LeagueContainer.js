import React, { Component } from 'react';
import LeagueTile from '../components/LeagueTile'
class LeagueContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      leagues:[],
      games: []
    }
    //this.validatePick = this.validatePick.bind(this)
  }
componentDidMount() {
  debugger
  fetch(`/api/v1/leagues`, {credentials: 'same-origin'})
  .then(response => {
    debugger
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
    let leagues = body.leagues
    debugger
    this.setState({leagues:leagues})
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

render() {
  let leagues;
  leagues = this.state.leagues.map((league) => {
    return(
      <LeagueTile
        key={league.id}
        name={league.league_name}
      />

    )
  }, this)
  return (
    <div>this is a league index</div>
  )
}
}
export default LeagueContainer
