import React, { Component } from "react"
import { Button, Row, Col, Container, Media } from "react-bootstrap"
import { Link } from "react-router-dom"

class Home extends Component {

    render(){
        const {
            logged_in,
            sign_in_route,
            sign_out_route
        } = this.props
        return(
            <Container >
                <Row>
                    <Col xs={8}>
                        <header>
                            <h1>Hello!</h1>
                        </header>
                        <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        {logged_in && <Link to = "/flashcards">
                        <Button variant="success">Get Started!</Button>
                        </Link>}
                        {!logged_in && <a href= "/users/sign_in">
                        <Button variant="success">Get Started!</Button>
                        </a>}
                    </Col>
                    <Col xs={4}>
                        <Media>
                        <img
                        src="../assets/learn-block-web.jpg"
                        alt="Learn Academy Logo"
                        />
                        </Media>
                    </Col>
                </Row>
            </Container>

        )
    }
}

export default Home
