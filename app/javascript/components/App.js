import React from "react"
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.min.css'
import { } from 'react-bootstrap'
import axios from 'axios'

// import Home from './Home'
// import Admin from './Admin'

class App extends React.Component {
  render() {
    return (
      <React.Fragment>
        {/* <Container>
          <Navbar bg="dark" variant="dark">
            <Navbar.Brand href="#home">App Rate</Navbar.Brand>
            <Navbar.Toggle />
            <Navbar.Collapse className="justify-content-end">
              <Navbar.Text>
              </Navbar.Text>
            </Navbar.Collapse>
          </Navbar>
            <Switch>
              <Route exact path="/" component={Home} />
              <Route path='/admin' component={Admin} /> 
            </Switch>
          </Router > 
        </Container > */}
      </React.Fragment >
    )
  }
}

export default App
