import React, { Component } from "react"
import { Button, ButtonToolbar, Container } from "react-bootstrap"

class About extends Component {
    render(){
        return(
            <Container>
                <header>
                        <h1>About us!</h1>
                </header>
                <div>
                    <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                </div>
                <div>
                    <h3>Credit:</h3>
                    <ul>
                    <li>Michael Abdelshahid</li>
                    <li>Jake Randall</li>
                    <li>Ofrey Barsheshet</li>
                    <li>Kristen Mulder</li>
                    </ul>
                </div>
            </Container>
        )
    }
}

export default About
