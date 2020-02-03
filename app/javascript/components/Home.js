import React, { Component } from "react"
import { Button } from "react-bootstrap"

class Home extends Component {
    render(){
        return(
            <div>
                <header>
                        <h1>Hello LEARN Student</h1>
                </header>
                <div>
                    <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                </div>
                <div>
                    <Button variant="success">Get Started!</Button>
                </div>
            </div>
        )
    }
}

export default Home
