import React, {useEffect, useState} from 'react';
import { Route, Switch, BrowserRouter } from "react-router-dom"
import MembershipsContainer from './MembershipsContainer'
import MembershipShowContainer from './MembershipShowContainer'
import LeagueShowContainer from './LeagueShowContainer'
const App = props => {

  return(
    <BrowserRouter>
      <Switch>
        <Route exact path='/memberships' component={MembershipsContainer } />
        <Route exact path='/memberships/:id' component={MembershipShowContainer} />
        <Route exact path='/leagues/:id' component={LeagueShowContainer} />
      </Switch>
    </BrowserRouter>
  )
}

export default App
