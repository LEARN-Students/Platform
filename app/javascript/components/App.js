import React from "react"
import { Navbar, Nav } from "react-bootstrap"
import { BrowserRouter as Router, Switch, Link } from "react-router-dom"
import { Home } from './Home'

class App extends React.Component {
  render () {
    const {
      logged_in,
      sign_in_route,
      sign_out_route
    } = this.props

    return (
      <Router>
        <Navbar bg="light" expand="lg">
          <Navbar.Brand href="#home">React-Bootstrap</Navbar.Brand>
              <Nav.Link href="#home">Home</Nav.Link>
              <Nav.Link href="#link">Link</Nav.Link>
              {logged_in && <Nav.Link href={sign_out_route}>Sign Out</Nav.Link>}
              {!logged_in && <Nav.Link href={sign_in_route}>Sign In</Nav.Link>}

        </Navbar>
        <Switch>
        </Switch>
      </Router>
    );
  }
}

export default App
