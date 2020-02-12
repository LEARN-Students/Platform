import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row, Image, OverlayTrigger, Popover } from "react-bootstrap"
import { getMyFlashcards, postFlashcards, deleteFlashcards, editFlashcards } from './apiCalls.js'



class FlashcardManage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            success: false,
            myList: [{front:"Manage Your Flashcards", back:"To add new flashcards please click Add Flashcard on the left-hand panel", subject:"myList"}],
            activeFlashcard: false,
            user_id: false,
            errors: false,
            form: {
                front: 'New Flashcard',
                back: 'Backside',
                source: 'Optional Source URL',
                subject: 'My List',
                user_id: 1
            }
        }
    }

    getMyList = () => {
        this.setState({activeFlashcard: this.state.myList[0]})
        getMyFlashcards()
            .then(flashcards => {
                return flashcards.filter(flashcard => flashcard.subject === "My List")
            })
            .then(myList => {
                this.setState({myList: myList})
            })
            .catch(error => console.log(error))
    }

    componentDidMount = () => {
        this.getMyList()
    }

    newFlashcard = () => {
        console.log("new Flashcard")
        let { myList, form } = this.state
        this.resetForm()
        myList.unshift(form)
        this.setState({myList: myList})
    }

    editFlashcard = (flashcard) => {
        console.log("edit");
        editFlashcards(flashcard)
        .then((response) => {
            if(response.ok){
                return this.getMyList()
            }
        })
        .catch(error => console.log(error))
    }

    postFlashcard = (flashcard) => {
        console.log("post");
        postFlashcards(flashcard)
        .then((response) => {
            console.log(response);
            if(response.ok){
                return this.getMyList()
            }
        })
        .catch(error => console.log(error))
    }

    deleteFlashcard = (flashcard) => {
        console.log("delete");
        console.log(flashcard);
        deleteFlashcards(flashcard)
        .then((response) => {
            this.getMyList()
        })
        .catch(error => console.log(error))
    }

    resetForm = () => {
        const newForm = {
            front: 'New Flashcard',
            back: 'Backside',
            source: 'Optional Source URL',
            subject: 'My List',
            // REMEMBER TO CHANGE THIS!!!!
            user_id: 1
        }
        this.setState(state => {form:newForm})
    }

    grabFlashcard = (flashcard) => {
        this.setState({form: flashcard})
    }

    // Allows the form to work
    handleChange = (event) => {
        let { form } = this.state
        form[event.target.name] = event.target.value
        this.setState({form: form})
    }

    render(){
      const { activeFlashcard, myList } = this.state
      let {front, back, source, subject} = this.state.form
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
                    { myList.map((flashcard,i) => {
                        return(
                            <Form.Group as={Row} key={flashcard.front+i}>
                            <Col><Form.Label>{flashcard.front.substr(0,19)}</Form.Label></Col>
                            <Col style={{display:"flex", justifyContent:"flex-end"}}>
                            <Image  src="../assets/cog32.png"
                                    style={{height:"1rem", marginRight:".4rem"}}
                                    onClick={() => this.grabFlashcard(flashcard)}/>
                            <OverlayTrigger
                                  key={"tooltip" + i}
                                  trigger="click"
                                  placement="right"
                                  ref={this.trashIcon}
                                  overlay={
                                    <Popover>
                                    <Popover.Content><Row><Col>
                                      Are you sure you want to delete this Flashcard Forever?</Col>
                                      </Row>
                                      <Row>
                                      <Col style={{display:"flex", justifyContent:"flex-end"}}>
                                      <Button variant="danger" onClick={() => {this.deleteFlashcard(flashcard)}}>Delete </Button>
                                      </Col>
                                      </Row>
                                    </Popover.Content>
                                    </Popover>
                                  }
                                >
                                <Image  src="../assets/trash32.png"
                                        style={{height:"1rem"}}
                                        />
                                    </OverlayTrigger>

                            </Col>
                            </Form.Group>
                        )
                    })}
                    </Form>
                    </Card.Text>
                    <Button variant="primary" onClick={() => {this.newFlashcard()}}>New Flashcard</Button>
                  </Card.Body>
                </Card>
                <Button variant="primary" style={{ margin: "1.25rem"}} href="/flashcards">Back</Button>
                </Col>
                    <Col sm={8}>
                    <Card>
                    <Container>
                    <Card.Body>
                    {activeFlashcard && <Card.Title>{activeFlashcard.front}</Card.Title>}
                    {activeFlashcard &&
                      <Card.Text>
                        {activeFlashcard.back}
                      </Card.Text>}
                    </Card.Body>
                        <Form>
                            <Form.Group controlId="Front">
                            <Form.Label>Flashcard Frontside</Form.Label>
                                <Form.Control
                                    type="text"
                                    name="front"
                                    placeholder={front}
                                    onChange={this.handleChange} />
                            </Form.Group>
                            <Form.Group controlId="Back">
                            <Form.Label>Flashcard Backside</Form.Label>
                                <Form.Control
                                name="back"
                                type="text"
                                placeholder={back}
                                onChange={this.handleChange}/>
                            </Form.Group>
                            <Form.Group controlId="Source">
                            <Form.Label>Optional Source URL</Form.Label>
                                <Form.Control
                                name="source"
                                type="url"
                                placeholder={source}
                                onChange={this.handleChange}/>
                            </Form.Group>
                        </Form>
                        </Container>
                    </Card>
                    <Button variant="success" type="submit" style={{ marginTop: '30px' }} onClick={() => this.postFlashcard(this.state.form)}>Add Flashcard</Button>
                    <Button variant="success" type="submit" style={{ marginTop: '30px' }} onClick={() => this.editFlashcard(this.state.form)}>Confirm Edits</Button>
                    </Col>
                    </Row>
            </Container>
        )
    }
}

export default FlashcardManage
