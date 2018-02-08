import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import PicksContainer from './PicksContainer'


const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/leagues/:id/picks' component={PicksContainer} />
    </Router>
  )
}


export default App
