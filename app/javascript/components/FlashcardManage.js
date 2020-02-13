import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row, Image, OverlayTrigger, Popover } from "react-bootstrap"
import { getMyFlashcards, postFlashcards, deleteFlashcards, editFlashcards } from './apiCalls.js'

class FlashcardManage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            activeFlashcard: false,
            user_id: false,
            myList: [{
                front:"Manage Your Flashcards",
                back:"To add new flashcards please click Add Flashcard on the left-hand panel",
                subject:"my List"}],
            form: {
                front: 'New Flashcard',
                back: 'Backside',
                source: 'Optional Source URL',
                subject: 'My List'
            },
        }
    }

    componentDidMount = () => {
    // When the page renders componentDidMount is called.
    // This is a React Lifecycle Method.
    // For more info visit: https://reactjs.org/docs/react-component.html#componentdidmount
        this.getMyList()
    }

    getMyList = () => {
    // getMyList primarily is used for retrieving My List subject flashcards that correspond to the user's id
        this.setState({activeFlashcard: this.state.myList[0]})
        getMyFlashcards()
            .then(flashcards => {
                return flashcards.filter(flashcard => flashcard.subject === "My List")
            })
            .then(myListAll => {
                return myListAll.filter(flashcard => flashcard.user_id === this.props.current_user.id)
            })
            .then(myList => {
                this.setState({myList: myList})
            })
            .catch(error => console.log(error))
    }

    newFlashcard = () => {
        console.log("new Flashcard")
        let { myList, form } = this.state
        const newForm = [{
            front: 'New Flashcard',
            back: 'Backside',
            source: 'Optional Source URL',
            subject: 'My List',
            user_id: this.props.current_user.id
        }]
        this.setState({form: newForm[0], myList: newForm.concat(myList)})
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

    grabFlashcard = (flashcard) => {
        this.setState({form: flashcard})
        this.setState({activeFlashcard: flashcard})
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
                            <Col xs={9}><Form.Label>{flashcard.front.substr(0,29)}</Form.Label></Col>
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
                                <Image src="../assets/trash32.png" style={{height:"1rem"}}/>
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
                    {activeFlashcard && <Card.Title>{front}</Card.Title>}
                    {activeFlashcard &&
                      <Card.Text>
                        {back}
                      </Card.Text>}
                    </Card.Body>
                        <Form>
                            <Form.Group controlId="Front">
                            <Form.Label>Flashcard Frontside</Form.Label>
                                <Form.Control
                                    type="text"
                                    name="front"
                                    value={front}
                                    onChange={this.handleChange} />
                            </Form.Group>
                            <Form.Group controlId="Back">
                            <Form.Label>Flashcard Backside</Form.Label>
                                <Form.Control
                                name="back"
                                type="text"
                                value={back}
                                onChange={this.handleChange}/>
                            </Form.Group>
                            <Form.Group controlId="Source">
                            <Form.Label>Optional Source URL</Form.Label>
                                <Form.Control
                                name="source"
                                type="url"
                                value={source}
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
