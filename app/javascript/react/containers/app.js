import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import PicksFormContainer from './PicksFormContainer'
import MembershipsContainer from './MembershipsContainer'
import NavBar from '../components/NavBar'
import BackButton from '../components/BackButton'
const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar}>
      <Route path='/leagues/:id/picks' component={PicksFormContainer} />
      <Route path='/memberships' component={MembershipsContainer} />
    </Route>
    </Router>
  )
}


export default App
