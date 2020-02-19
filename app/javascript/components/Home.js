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
                            <h1 style={{fontSize:"4em"}}>Hello World!</h1>
                        </header>
                        <br/>
                        <p style={{fontSize:"2em"}}>The LEARN student platform is an open-source resource for learning programming built by LEARN students for LEARN students! <br/></p>
                        <p style={{fontSize:"2em"}}>To learn more about contributing to the project, please visit our <a href="https://github.com/LEARN-Students/Platform">GitHub repo</a>. To get started developing programming mastery, click below!</p>
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
                        src="../assets/learn_students_logo.png"
                        alt="Learn Academy Logo"
                        />
                    </Col>
                </Row>
            </Container>

        )
    }
}

export default Home
