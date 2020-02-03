import React, { Component } from "react"
import { Button, Card } from "react-bootstrap"

class FlashcardIntro extends Component {
    render(){
        return(
            <div>
                <header>
                        <h1>Flashcard Introduction</h1>
                </header>
                    <div>
                        <Card style={{ width: '18rem' }}>
                          <Card.Body>
                            <Card.Title>How to:</Card.Title>
                            <Card.Subtitle className="mb-2 text-muted">Card Subtitle</Card.Subtitle>
                            <Card.Text>
                              Some quick example text to build on the card title and make up the bulk of
                              the card's content.
                            </Card.Text>
                          </Card.Body>
                        </Card>
                    </div>
                    <div>
                        <Button variant="success">Begin</Button>
                    </div>
            </div>
        )
    }
}

export default FlashcardIntro
