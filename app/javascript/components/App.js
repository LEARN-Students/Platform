import React from "react"
import { Navbar, Nav } from "react-bootstrap"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
import Home from "./Home"
import About from "./About"
import FlashcardIntro from "./FlashcardIntro"

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
          <Navbar.Brand href="/">React-Bootstrap</Navbar.Brand>
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/flashcards">Flashcards</Nav.Link>
              <Nav.Link href="/about">About</Nav.Link>
              {logged_in && <Nav.Link href={sign_out_route}>Sign Out</Nav.Link>}
              {!logged_in && <Nav.Link href={sign_in_route}>Sign In</Nav.Link>}

        </Navbar>
        <Switch>
            <Route exact path="/" component={ Home } />
            <Route exact path="/flashcards" component={ FlashcardIntro } />
            <Route exact path="/flashcards/manage" component={ FlashcardIntro } />
            <Route exact path="/about" component={ About } />
        </Switch>
      </Router>
    );
  }
}

export default App
