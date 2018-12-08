import React, { Component } from 'react';
import GameTile from '../components/GameTile'

class LeagueShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state={
      id: this.props.id
    }
    this.chooseLeague = this.chooseLeague.bind(this)
  }


    render() {

    return (
      <div>I am a container</div>
      )
    }
}



export default LeagueShowContainer
