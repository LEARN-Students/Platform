import React, { Component } from "react"
import { Button, Row, Col, Container, Media } from "react-bootstrap"

class Home extends Component {
    render(){
        return(
            <Container >
                <Row align-items="center">
                    <Col xs={8}>
                        <header>
                            <h1>Hello!</h1>
                        </header>
                        <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        <Button variant="success">Get Started!</Button>
                    </Col>
                    <Col xs={4}>
                        <Media>
                        <img
                        src="../assets/learn-block-web.jpg"
                        alt="Generic placeholder"
                        />
                        </Media>
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default Home
