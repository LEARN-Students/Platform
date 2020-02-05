import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row, Image } from "react-bootstrap"

class FlashcardManage extends Component {
    render(){
      const style = {"align-content": "flex-end"}
        return(
            <Container>
                <header>
                        <h1>Flashcard Management</h1>
                </header>
                <Row>
                <Col sm={4}>
                <Card>
                  <Card.Header as="h5">My List</Card.Header>
                  <Card.Body>
                    <Card.Text>
                    <Form>
                      <Form.Check label={`Filler`}/>
                      <Form.Check label={`Filler`}/>
                      <Form.Check label={`Filler`}/>
                      <Form.Check label={`Filler`}/>
                    </Form>
                    </Card.Text>
                    <Button variant="primary">Add Flashcard</Button>
                  </Card.Body>
                </Card>
                </Col>
                    <Col sm={8}>
                    <Card style={{ width: '100%' }}>
                      <Card.Body>
                        <Card.Title>Frontside</Card.Title>
                        <Card.Text>
                          Some quick example text to build on the card title and make up the bulk of
                          the card's content.
                        </Card.Text>
                      </Card.Body>
                    </Card>
                    <Card style={{ width: '100%', marginTop: '30px' }}>
                      <Card.Body>
                        <Card.Title>Backside</Card.Title>
                        <Card.Text>
                          Some quick example text to build on the card title and make up the bulk of
                          the card's content.
                        </Card.Text>
                      </Card.Body>
                    </Card>
                    <Button variant="success" style={{ marginTop: '30px' }}>Confirm Edits</Button>
                    </Col>
                    </Row>
            </Container>
        )
    }
}

export default FlashcardManage


// {['checkbox'].map(type => (
//                       <Row>
//                         <div style ={style} key={`default-${type}`} className="mb-3">
//                           <Form.Check
//                           type={type}
//                           id={`default-${type}`}
//                           label={`Filler`}
//                           />
//                           <Image src="../assets/cog24.png"/>
//                           </div>
//                       </Row>
//                       ))}