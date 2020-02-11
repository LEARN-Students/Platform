import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row, Image } from "react-bootstrap"


class FlashcardManage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            myList: [{front:"Manage Your Flashcards", back:"To add new flashcards please click Add Flashcard on the left-hand panel", subject:"myList"}],
            activeFlashcard: false,
            user_id: false,
            errors: false,
            form: {
                front: '',
                back: '',
                source: '',
                subject: ''
            }
        }
    }

    getMyList = () => {
        this.setState({activeFlashcard: this.state.myList[0]})
        fetch("http://localhost:3000/flashcards")
            .then(response => {
                if (response.ok) {return response.json()}
                else {throw new Error('Something went wrong ...')}
            })
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

    editFlashcard = (flashcard) => {
        console.log("edit");
        this.setState({activeFlashcard:flashcard})
    }

    postFlashcard = (flashcard) => {
        console.log("post");
        this.setState({activeFlashcard:flashcard})
        return fetch('http://localhost:3000/flashcards', {
            body: JSON.stringify(flashcard),  // <- we need to stringify the json for fetch
            headers: {  // <- We specify that we're sending JSON, and expect JSON back
              'Content-Type': 'application/json'
            },
            method: "POST"  // <- Here's our verb, so the correct endpoint is invoked on the server
          })
          // .then((response) => {
          //     window.location.href = "http://localhost:3000/flashcards/manage";
          // })
          .catch(error => {
            console.log(error)
            this.setState({errors: error})})
    }

    deleteFlashcard = (flashcard) => {
        console.log("delete");
        console.log(flashcard);
        return fetch('http://localhost:3000/flashcards/' + flashcard.id, {
            body: JSON.stringify(flashcard),  // <- we need to stringify the json for fetch
            headers: {  // <- We specify that we're sending JSON, and expect JSON back
              'Content-Type': 'application/json'
            },
            method: "DELETE"  // <- Here's our verb, so the correct endpoint is invoked on the server
          })
          .then((response) => {
              this.getMyList()
          })
          .catch(error => {
            console.log(error)
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
                                    onClick={() => this.editFlashcard(flashcard)}/>
                            <Image  src="../assets/trash32.png"
                                    style={{height:"1rem"}}
                                    onClick={() => {this.deleteFlashcard(flashcard)}}/>
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
                                    value={front}
                                    onChange={this.handleChange} />
                            </Form.Group>
                            <Form.Group controlId="Back">
                                <Form.Control name="back" type="text" value={back} onChange={this.handleChange}/>
                            </Form.Group>
                            <Form.Group controlId="Source">
                                <Form.Control name="source" type="url" value={source} onChange={this.handleChange}/>
                            </Form.Group>
                        </Form>
                    </Card>
                    <Button variant="success" style={{ marginTop: '30px' }} onClick={() => {this.postFlashcard()}}>Confirm Edits</Button>
                    </Col>
                    </Row>
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
