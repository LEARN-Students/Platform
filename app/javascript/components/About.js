import React, { Component } from "react"
import { Container, Image, Col, Row } from "react-bootstrap"

class About extends Component {
    render(){
        return(
            <Container>
                <header style={{display:"flex", justifyContent:"center"}}>
                        <h1>About us!</h1>
                </header>
                <div>
                    <Row style={{display:"flex", alignItems:"center"}}>
                        <Col xs={8} className="firstParagraph">
                            <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        </Col>
                        <Col xs={4}>
                            <Image 
                            src="../assets/placeholder.png" thumbnail
                            alt="placeholer image"
                            width={200}
                            height={200}
                            />
                        </Col>
                    </Row>
                    <Row style={{ display: "flex", alignItems: "center" }}>
                        <Col xs={4}>
                            <Image
                                src="../assets/placeholder.png" thumbnail
                                alt="placeholer image"
                                width={200}
                                height={200}
                            />
                        </Col>
                        <Col xs={8} className="firstParagraph">
                            <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        </Col>
                    </Row>
                    <Row style={{ display: "flex", alignItems: "center" }}>
                        <Col xs={8} className="firstParagraph">
                            <p>Welcome to our webpage, be sure to check out the flashcards and hit the button below to get started!</p>
                        </Col>
                        <Col xs={4}>
                            <Image 
                            src="../assets/placeholder.png" thumbnail
                            alt="placeholer image"
                            width={200}
                            height={200}
                            />
                        </Col>
                    </Row>
                    <div>
                        <h3>Credit:</h3>
                        <ul>
                        <li>Michael Abdelshahid</li>
                        <li>Jake Randall</li>
                        <li>Ofrey Barsheshet</li>
                        <li>Kristen Mulder</li>
                        </ul>
                    </div>
                </div>
            </Container>
        )
    }
}

export default About
