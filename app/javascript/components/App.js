import React from "react"
import { Navbar, Nav, Image } from "react-bootstrap"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
//pages
import Home from "./Home"
import About from "./About"
import Flashcard from "./Flashcard"
import FlashcardManage from "./FlashcardManage"
import "bootswatch/dist/lumen/bootstrap.min.css"; 


class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {

        }

    }
    render () {
        const {
          logged_in,
          sign_in_route,
          sign_out_route,
          current_user
        } = this.props

    return (
      <Router>
        <Navbar style={{ marginBottom: "4em" }} bg="light" expand="lg" >
          <Navbar.Brand href="/" fluid><Image
          style={{ height: "4em" }}
          src="../assets/learn_students_logo.png"
          alt="Learn Students Logo"
          /></Navbar.Brand>
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/flashcards">Flashcards</Nav.Link>
              <Nav.Link className="about" href="/about">About</Nav.Link>
              {logged_in && <Nav.Link href={sign_out_route}>Sign Out</Nav.Link>}
              {!logged_in && <Nav.Link href={sign_in_route}>Sign In</Nav.Link>}
              {!logged_in &&<Nav.Link href = "/users/sign_up" > Sign Up </Nav.Link>}
        </Navbar>
        <Switch>
            <Route exact path="/flashcards" component={ Flashcard } />
            <Route exact path="/flashcards/manage" component={ FlashcardManage } current_user={current_user}/>
            <Route exact path="/about" component={ About } />
            <Route exact path="/" render={props => (<Home {...props}/>)}/>
        </Switch>
      </Router>
    );
  }
}

export default App
