import React, {useEffect, useState} from 'react';
import { Route, Switch, BrowserRouter } from "react-router-dom"
import MembershipsContainer from './MembershipsContainer'
import MembershipShowContainer from './MembershipShowContainer'
const App = props => {

  return(
    <BrowserRouter>
      <Switch>
        <Route exact path='/memberships' component={MembershipsContainer } />
        <Route exact path='/memberships/:id' component={MembershipShowContainer} />
      </Switch>
    </BrowserRouter>
  )
}

export default App
