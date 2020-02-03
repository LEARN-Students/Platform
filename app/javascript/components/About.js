import React, { Component } from "react"
import { Button, ButtonToolbar } from "react-bootstrap"

class About extends Component {
    render(){
        return(
            <div>
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
                <div>
                    <h3>Contact:</h3>
                    <h4>Email:</h4>
                    <ul>
                        <li>ofrey.barsheshetdev@gmail.com</li>
                        <li>mna4642@gmail.com</li>
                    </ul>
                </div>
            </div>
        )
    }
}

export default About
