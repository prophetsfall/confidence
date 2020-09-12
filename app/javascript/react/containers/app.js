import React from "react"
import { BrowserRouter, Route, Switch } from "react-router-dom"
import PickContainer from './PickContainer'

const App = props => {

  return(
    <BrowserRouter>
      <Route path='/leagues/:id/picks' component={PickContainer} />
    </BrowserRouter>
  )
}


export default App
