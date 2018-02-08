import React, { Component } from 'react';
import GameTile from '../components/GameTile'

class PicksContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      leagueID:0,
      games: []
    }
  }

  componentDidMount() {
    let leagueID = this.props.params.id;
    fetch(`/api/v1/picks`, {credentials: 'same-origin'})
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
    .then(body => {debugger
      this.setState({leagueID: leagueID, games: body.games})
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }




  render(){
    let games = this.state.games.map((game) => {
      return(
        <GameTile
          key={game.id}
          id={game.id}
          homeTeamName={game.home_team_name}
          awayTeamName={game.away_team_name}
          homeTeamLocation={game.home_team_location}
          awayTeamLocation={game.away_team_location}
          winningTeam={game.winningTeam}
        />
      )
    })

    return(
      <div className="picksContainer">
        hi from picks container
        {games}
      </div>
    )
  }
}
export default PicksContainer
