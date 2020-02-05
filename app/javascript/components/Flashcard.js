import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row } from "react-bootstrap"
import { NavLink as Link } from "react-router-dom"


class Flashcard extends Component {
    constructor(props) {
        super(props);
        this.state = {
            flashcardSide: "front",
            activeFlashcard: [],
            flashcards: [{
                        front:"Boolean",
                        back:"words",
                        source:"more words URL",
                        subject:"My List",
                        user_id:"3456"},
                        {front:"Function",
                        back:"Function",
                        source:"2more words URL",
                        subject:"My List",
                        user_id:"20000"},
                        {front:"Turnary",
                        back:"2words",
                        source:"2more words URL",
                        subject:"My List",
                        user_id:"20000"},
                        {front:"Operations",
                        back:"2words",
                        source:"2more words URL",
                        subject:"My List",
                        user_id:"20000"}]
        }
    }
    render(){
        return(
            <Container>
                <header>
                        <h1>Flashcard Management</h1>
                </header>
                <Row>
                <Col sm={4}>
                <Card>
                  <Card.Header as="h5">Subjects</Card.Header>
                  <Card.Body>
                    <Card.Text>
                    <Form>
                    {['checkbox'].map(type => (
                        <div key={`default-${type}`} className="mb-3">
                        <Form.Check
                        type={type}
                        id={`default-${type}`}
                        label={`Javascript`}
                        />
                        <Form.Check
                        type={type}
                        id={`default-${type}`}
                        label={`Ruby`}
                        />
                        <Form.Check
                        type={type}
                        id={`default-${type}`}
                        label={`React`}
                        />
                        <Form.Check
                        type={type}
                        id={`default-${type}`}
                        label={`My List`}
                        />
                        </div>
                    ))}
                    </Form>
                    </Card.Text>
                    <Link to="/flashcards/manage">
                      <Button variant = "primary"> Manage My List! </Button>
                    </Link>
                  </Card.Body>
                </Card>
                </Col>
                    <Col sm={8}>
                    <Card style={{ width: '100%' }}>
                      <Card.Body>
                        <Card.Title>How to:</Card.Title>
                        <Card.Text>
                          Some quick example text to build on the card title and make up the bulk of
                          the card's content.
                        </Card.Text>
                      </Card.Body>
                    </Card>
                        <Button variant="success">Begin</Button>
                    </Col>
                    </Row>
            </Container>
        )
    }
}
{/* comment */}
export default Flashcard
