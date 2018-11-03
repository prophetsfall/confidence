import React, { Component } from 'react';

class MembershipsContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      leagueID:0,
      week:0,
      games: [],
      picks:[],
      noGames: false,
      mainSlate: null,
      errors: ""
    }
    // this.handleSelectWinner = this.handleSelectWinner.bind(this) commented to remind me about placement and binding
  }
  componentDidMount() {
    let leagueID = this.props.params.id;
    fetch(`/api/v1/leagues/${leagueID}/memberships`, {credentials: 'same-origin'})
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
      let mainSlateStart = Date.parse(body.main)
      if (body.games === "none"){
        this.setState({noGames: true})
      }
      else {
        this.setState({
          leagueID: leagueID,
          games: body.games,
          week: 0,
          picks: body.picks,
          mainSlate: mainSlateStart,
        })
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    return
    <div className="fieldBackgroundForm">
      This is a React page
    </div>
  }
}



export default MembershipsContainer
