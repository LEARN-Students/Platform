import React, { Component } from "react"
<<<<<<< HEAD
import { Button, Card, Form, Container, Col, Row, Image, OverlayTrigger, Popover } from "react-bootstrap"
=======
import { Button, Card, Form, Container, Col, Row, Image } from "react-bootstrap"
import { getMyFlashcards, postFlashcards, deleteFlashcards, editFlashcards } from './apiCalls.js'
>>>>>>> 7883f19a603d2d38a9b19eec576b7f400f290978


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
                front: 'Front',
                back: 'Back',
                source: 'Source URL',
                subject: 'MyList',
                user_id: 1
            }
        }
    }

    getMyList = () => {
        this.setState({activeFlashcard: this.state.myList[0]})
        getMyFlashcards()
            .then(flashcards => {
                return flashcards.filter(flashcard => flashcard.subject === "MyList")
            })
            .then(myList => {
                this.setState({myList: myList})
            })
            .catch(error => this.setState({errors: error}))
    }

    componentDidMount = () => {
        this.getMyList()
    }

    addFlashcard = () => {
        console.log("add Flashcard")
        let { myList, form } = this.state
        myList.push(form)
        this.setState({myList: myList})
        this.editFlashcard(myList[myList.length-1])
    }

    setForm = (flashcard) => {
        const{form} = this.state
        const{myList} = this.state.myList
        this.setState({form: flashcard})
        console.log(flashcard);
    }

    handleEdit = () => {
        console.log("handleEdit");
        this.editFlashcard(this.state.form)
        .then(() => {
            this.setState({success: true})
        })
        console.log(this.state.form);
    }

    editFlashcard = (flashcard) => {
        console.log("edit");
        editFlashcards(flashcard)
        .then((response) => {
            if(response.ok){
                return this.getMyList()
            }
        })
        .catch(error => {
          this.setState({errors: error})})
    }

    handleSubmit = () => {
        console.log("handleSubmit");
        console.log(this.state.form);
        this.postFlashcard(this.state.form)
        .then(() => {
            this.setState({success:true})
        })
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
        .catch(error => {
          this.setState({errors: error})})
    }

    deleteFlashcard = (flashcard) => {
        console.log("delete");
        console.log(flashcard);
        deleteFlashcards(flashcard)
        .then((response) => {
            this.getMyList()
        })
        .catch(error => {
          this.setState({errors: error})})
    }

    handleChange = (event) => {
        console.log("handleChange Called");
        let { form } = this.state
        form[event.target.name] = event.target.value
        this.setState({form: form})
        console.log(form);
    }

    render(){
      const style = {"align-content": "flex-end"}
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
                            <Form.Group as={Row} key={flashcard.front+i} style={{}}>
                            <Col><Form.Label>{flashcard.front}</Form.Label></Col>
                            <Col style={{display:"flex", justifyContent:"flex-end"}}>
                            <Image  src="../assets/cog32.png"
                                    style={{height:"1rem", marginRight:".4rem"}}
                                    onClick={() => this.setForm(flashcard)}/>
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
                    <Button variant="primary" onClick={() => {this.addFlashcard()}}>Add Flashcard</Button>
                  </Card.Body>
                </Card>
                <Button variant="primary" style={{ margin: "1.25rem"}} href="/flashcards">Back</Button>
                </Col>
                    <Col sm={8}>
                    <Card style={{ width: '100%' }}>
                      <Card.Body>
                      {activeFlashcard && <Card.Title>{activeFlashcard.front}</Card.Title>}
                      {activeFlashcard &&
                        <Card.Text>
                          {activeFlashcard.back}
                        </Card.Text>}
                        {!activeFlashcard && <Card.Title>No Flashcard Selected Front</Card.Title>}
                        {!activeFlashcard &&
                          <Card.Text>
                            Some quick example text to build on the card title and make up the bulk of
                            the card's content.
                          </Card.Text>}
                      </Card.Body>
                    </Card>
                    <Card>
                        <Form style={{}}>
                            <Form.Group controlId="Front">
                                <Form.Control
                                    type="text"
                                    name="front"
                                    placeholder={front}
                                    value={front}
                                    onChange={this.handleChange} />
                            </Form.Group>
                            <Form.Group controlId="Back">
                                <Form.Control
                                name="back"
                                type="text"
                                placeholder={back}
                                value={back}
                                onChange={this.handleChange}/>
                            </Form.Group>
                            <Form.Group controlId="Source">
                                <Form.Control
                                name="source"
                                type="url"
                                placeholder={source}
                                value={source}
                                onChange={this.handleChange}/>
                            </Form.Group>
                        </Form>
                    </Card>
                    <Button variant="success" type="submit" style={{ marginTop: '30px' }} onClick={this.handleSubmit}>Add Flashcard</Button>
                    <Button variant="success" type="submit" style={{ marginTop: '30px' }} onClick={this.handleEdit}>Confirm Edits</Button>
                    </Col>
                    </Row>
                    {this.state.success &&
                        <Redirect to="/flashcards"/>
                    }
            </Container>
        )
    }
}

export default FlashcardManage








// <Card style={{ width: '100%' }}>
//   <Card.Body>
//   {activeFlashcard && <Card.Title>{activeFlashcard.front}</Card.Title>}
//   {activeFlashcard &&
//     <Card.Text>
//       {activeFlashcard.back}
//     </Card.Text>}
//     {!activeFlashcard && <Card.Title>No Flashcard Selected Front</Card.Title>}
//     {!activeFlashcard &&
//       <Card.Text>
//         Some quick example text to build on the card title and make up the bulk of
//         the card's content.
//       </Card.Text>}
//   </Card.Body>
// </Card>

// <Card style={{ width: '100%', marginTop: '30px' }}>
// <Card.Body>
// {activeFlashcard && <Card.Title>Flashcard Selected Back Side</Card.Title>}
// {activeFlashcard &&
//   <Card.Text>
//     {myList[0].back}
//   </Card.Text>}
//   {!activeFlashcard && <Card.Title>No Flashcard Selected Black</Card.Title>}
//   {!activeFlashcard &&
//     <Card.Text>
//       Some quick example text to build on the card title and make up the bulk of
//       the card's content.
//     </Card.Text>}
// </Card.Body>
// </Card>
