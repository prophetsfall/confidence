import React, {Component} from 'react';

class LeagueTile extends Component {
  constructor(props) {
    super(props);
    this.state={
      league:this.props.league,
    }
  }

  render(){
    debugger
    let league = this.state.league
      return(
        <div>
          <div className="small-6 medium-4 large-3 columns end gameTile">
              {league}
            </div>
        </div>
      )
    }
  }


export default LeagueTile
