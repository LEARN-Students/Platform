import React from "react"
import { Navbar, Nav } from "react-bootstrap"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
import Home from "./Home"
import About from "./About"
import Flashcard from "./Flashcard"
import FlashcardManage from "./FlashcardManage"

class App extends React.Component {
  render () {
    const {
      logged_in,
      sign_in_route,
      sign_out_route
    } = this.props

    return (
      <Router>
        <Navbar style={{ marginBottom: "4em" }} bg="light" expand="lg" >
          <Navbar.Brand href="/">LOGO</Navbar.Brand>
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/flashcards">Flashcards</Nav.Link>
              <Nav.Link href="/about">About</Nav.Link>
              {logged_in && <Nav.Link href={sign_out_route}>Sign Out</Nav.Link>}
              {!logged_in && <Nav.Link href={sign_in_route}>Sign In</Nav.Link>}
              {!logged_in &&<Nav.Link href = "/users/sign_up" > Sign Up </Nav.Link>}
        </Navbar>
        <Switch>
            <Route exact path="/" render={props => (<Home {...props}/>)}/>
            <Route exact path="/flashcards" component={ Flashcard } />
            <Route exact path="/flashcards/manage" component={ FlashcardManage } />
            <Route exact path="/about" component={ About } />
        </Switch>
      </Router>
    );
  }
}

export default App
