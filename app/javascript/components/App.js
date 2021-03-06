import React from "react"
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import { Container, Navbar } from 'react-bootstrap'
import axios from 'axios'

import Home from './Home'
import Admin from './Admin'

const csrfToken = document.querySelector('[name="csrf-token"]').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

class App extends React.Component {
  render() {
    return (
      <React.Fragment>
        <Container>
          <Navbar bg="dark" variant="dark">
            <Navbar.Brand href="#home">App Rate</Navbar.Brand>
            <Navbar.Toggle />
            <Navbar.Collapse className="justify-content-end">
              <Navbar.Text>
              </Navbar.Text>
            </Navbar.Collapse>
          </Navbar>
          <Router>
            <Switch>
              <Route exact path="/" component={Home} />
              <Route path='/admin' component={Admin} />
            </Switch>
          </Router>
        </Container>
      </React.Fragment>
    )
  }
}

export default App
