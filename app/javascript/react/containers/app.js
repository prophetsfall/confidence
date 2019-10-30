import React from 'react';
import { Route, Switch, BrowserRouter } from "react-router-dom"
// import PicksFormContainer from './PicksFormContainer'
import HookFormContainer from './HookFormContainer'

const App = props => {
  return(
    <BrowserRouter>
      <Switch>
        <Route exact path='/leagues/:id/picks' component={HookFormContainer} />
      </Switch>
    </BrowserRouter>
  )
}


export default App
