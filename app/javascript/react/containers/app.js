import React from 'react';
import { Route, Switch, BrowserRouter } from "react-router-dom"
// import PicksFormContainer from './PicksFormContainer'
import HookFormContainer from '../hooksStuff/HookFormContainer'
import DualSidedPicks from '../hooksStuff/DualSidedPicks'

const App = props => {
  return(
    <BrowserRouter>
      <Switch>
        <Route exact path='/leagues/:id/picks' component={HookFormContainer } />
      </Switch>
    </BrowserRouter>
  )
}


export default App
