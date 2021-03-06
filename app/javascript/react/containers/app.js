import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import PicksFormContainer from './PicksFormContainer'

const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/leagues/:id/picks' component={PicksFormContainer} />
    </Router>
  )
}


export default App
