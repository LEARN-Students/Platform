import React, { Component } from "react"
import { Button, Row, Col, Container, Media, Image } from "react-bootstrap"
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
                <Row style={{alignItems:"center"}}>
                    <Col xs={8}>
                        <header>
                            <h1 style={{fontSize:"4em"}}>Hello!</h1>
                        </header>
                        <p style={{fontSize:"2em"}}>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        {logged_in && <a href= "/flashcards">
                        <Button variant="success">Get Started!</Button>
                        </a>}
                        {!logged_in && <a href= "/users/sign_in">
                        <Button variant="success">Get Started!</Button>
                        </a>}
                    </Col>
                    <Col xs={4}>
                        <Image
                        style={{width:"inherit"}}
                        src="../assets/learnLogo.png"
                        alt="Learn Academy Logo"
                        />
                    </Col>
                </Row>
            </Container>

        )
    }
}

export default Home
