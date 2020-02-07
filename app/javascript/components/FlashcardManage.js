import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row, Image } from "react-bootstrap"


class FlashcardManage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            activeFlashcard: [],
            myList: [{
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
        console.log(this.state);
        console.log(this.state.activeFlashcard);
        console.log(this.state.activeFlashcard == false);
    }

    edit = (flashcard) => {
        console.log(flashcard);
        this.setState({activeFlashcard: [flashcard]})
        console.log(this.state.activeFlashcard);
    }

    delete = (flashcard) => {
        console.log("delete");
    }

    render(){
      const style = {"align-content": "flex-end"}
      const { activeFlashcard, myList } = this.state
        return(
            <Container>
                <header>
                        <h1 style={{ marginBottom:"4rem" }}>Flashcard Management</h1>
                </header>
                <Row>
                <Col sm={4}>
                <Card>
                  <Card.Header as="h5">My List</Card.Header>
                  <Card.Body>
                    <Card.Text>
                    <Form>
                    {myList.map(flashcard => {
                        return(
                            <Form.Group as={Row} key={flashcard.front} style={{}}>
                            <Col><Form.Label>{flashcard.front}</Form.Label></Col>
                            <Col style={{display:"flex", justifyContent:"flex-end"}}>
                            <Image src="../assets/cog32.png" style={{height:"1rem", marginRight:".4rem"}} onClick={() => this.edit(flashcard)}/>
                            <Image src="../assets/trash32.png" style={{height:"1rem"}} onClick={() => this.delete(flashcard)}/>
                            </Col>
                            </Form.Group>
                    )})}
                    </Form>
                    </Card.Text>
                    <Button variant="primary">Add Flashcard</Button>
                  </Card.Body>
                </Card>
                <Button variant="primary" style={{ margin: "1.25rem"}} href="/flashcards">Back</Button>
                </Col>
                    <Col sm={8}>
                    <Card style={{ width: '100%' }}>
                      <Card.Body>
                        <Card.Text>
                        <Form>
                        {flashcards.map(flashcard => {
                            return(
                                <Form.Group as={Row} key={flashcard.front} style={{}}>
                                <Col><Form.Label>{flashcard.front}</Form.Label></Col>
                                <Col style={{display:"flex", justifyContent:"flex-end"}}>
                                <Image src="../assets/cog32.png" style={{height:"1rem", marginRight:".4rem"}} onClick={() => this.edit(flashcard)}/>
                                <Image src="../assets/trash32.png" style={{height:"1rem"}} onClick={() => this.delete(flashcard)}/>
                                </Col>
                                </Form.Group>
                        )})}
                        </Form>
                        </Card.Text>
                        <Button variant="primary">Add Flashcard</Button>
                      </Card.Body>
                    </Card>
                    </Col>
                        <Col sm={8}>
                        <Card style={{ width: '100%' }}>
                          <Card.Body>
                          {activeFlashcard && <Card.Title>Flashcard Selected Front Side</Card.Title>}
                          {activeFlashcard &&
                            <Card.Text>
                              {flashcards[0].front}
                            </Card.Text>}
                            {!activeFlashcard && <Card.Title>No Flashcard Selected Front</Card.Title>}
                            {!activeFlashcard &&
                              <Card.Text>
                                Some quick example text to build on the card title and make up the bulk of
                                the card's content.
                              </Card.Text>}
                          </Card.Body>
                        </Card>
                        <Card style={{ width: '100%', marginTop: '30px' }}>
                        <Card.Body>
                        {activeFlashcard && <Card.Title>Flashcard Selected Back Side</Card.Title>}
                        {activeFlashcard &&
                          <Card.Text>
                            {flashcards[0].back}
                          </Card.Text>}
                          {!activeFlashcard && <Card.Title>No Flashcard Selected Black</Card.Title>}
                          {!activeFlashcard &&
                            <Card.Text>
                              Some quick example text to build on the card title and make up the bulk of
                              the card's content.
                            </Card.Text>}
                        </Card.Body>
                        </Card>
                        <Button variant="success" style={{ marginTop: '30px' }}>Confirm Edits</Button>
                        </Col>
                        </Row>
                </Container>
            </div>
        )
    }
}

export default FlashcardManage
