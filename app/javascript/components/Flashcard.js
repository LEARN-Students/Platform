import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row } from "react-bootstrap"
import { NavLink as Link } from "react-router-dom"


// from getData we will get all the flashcards seperated by Subject
//



class Flashcard extends Component {
    constructor(props) {
        super(props);
        this.state = {
            flashcards: [],
            // true boolean represents front, false boolean represents back
            flashcardSide: true,
            javascript: false,
            javascriptFC:[],
            ruby: false,
            rubyFC:[],
            myList:false,
            myListFC:[],
            error: ""
        }
    }

    componentDidMount = () => {
// function will need to fetch data from our JSON API
// we should seperate the data by subject so we can xport just what me need
// the reason we will abstract out this function into its own file is that it is needed in two different components ( Flashcards & FlashcardManage)
        fetch("http://localhost:3000/flashcards")
            .then((response) => {
                console.log(response)
                console.log(response.status)
                if(response.status == 200) {
                    return(response.json())
                }
            })
            .then((flashcardsArray) => {
                var jsMethods = flashcardsArray.filter(flashcard => {
                    return flashcard.subject === "Javascript Methods"
                })
                this.setState({javascriptFC: jsMethods})

                var rubyMethods = flashcardsArray.filter(flashcard => {
                    return flashcard.subject === "Ruby Methods"
                })
                this.setState({rubyFC: rubyMethods})
            })
            .catch((error)=>{
                this.setState({ error: `Sorry, there was a problem.  ${error.message}`})
            })
    }

    shuffle = (array) => {
        // Simple solution to creating a random-like array
        // That somewhat works, because Math.random() - 0.5 is a random number that may be positive or negative, so the sorting function reorders elements randomly.
        // But because the sorting function is not meant to be used this way, not all permutations have the same probability.
        array.sort(() => Math.random() - 0.5)
        this.setState({flashcards: array})
        console.log(this.state.flashcards);
        console.log(this.state.flashcards[0]);
    }

    flashcardAggregator = () => {
        // Destructuring our variables
        const { flashcards,
            javascript, javascriptFC,
            ruby, rubyFC,
            mylist, myListFC
        } = this.state
        // Setting a new array to aggregate the active flashcards
        let aggArray = []
        // Reset the state of flashcards to empty
        this.setState({flashcards: aggArray})
        // Checks if the user has checked the box (boolean true/false)
        // & puts the flashcards from the lists in state into the empty array
        // if the value of javascript stored in state is true
        if(javascript){
            // push the FC objects in the javascriptFC array of flashcards into aggArray
            javascriptFC.map(flashcard =>{
                aggArray.push(flashcard)
            })
        }
        if(ruby){
            rubyFC.map(flashcard =>{
                aggArray.push(flashcard)
            })
        }
        this.shuffle(aggArray)
    }

    gotIt = () => {
        const { flashcards } = this.state
        this.setState({flashcards: flashcards.slice(1)})
    }

    keepStudying = () => {
        const { flashcards } = this.state
        var array = flashcards
        var curFC = array.shift()
        array = array.concat(curFC);
        this.setState({flashcards: array})
    }

    render(){
        const { flashcards, javascript, ruby, myList } = this.state
        return(
            <Container>
                <header>
                    <h1 style={{ marginBottom:"4rem" }}>Flashcards</h1>
                </header>
                <Row>
                    <Col sm={4}>
                        <Card>
                          <Card.Header as="h5">Subjects</Card.Header>
                          <Card.Body>
                            <Card.Text>
                            <Form>
                                <Form.Check
                                type="checkbox"
                                label="Javascript"
                                onClick={() => {this.setState({javascript: !javascript})}}
                                />
                                <Form.Check
                                type="checkbox"
                                label="Ruby"
                                onClick={() => {this.setState({ruby: !ruby})}}
                                />
                                <Form.Check
                                type="checkbox"
                                label="myList"
                                onClick={() => {this.setState({myList: !myList})}}
                                />
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
                        {/*if there are no flashcards in the array*/}
                        {flashcards.length == 0 && <Card.Title>How to:</Card.Title>}
                        {flashcards.length == 0 && <Card.Text>
                          Some quick example text to build on the card title and make up the bulk of
                          the card's content.
                        </Card.Text>}
                        {flashcards.length > 0 && <Card.Title>{flashcards[0].front}</Card.Title>}
                        {flashcards.length > 0 && <Card.Text>
                         {flashcards[0].back}
                        </Card.Text>}
                        {flashcards.length > 0 && <Card.Text style={{display:"flex", justifyContent:"flex-end"}}>
                         {flashcards[0].subject}
                        </Card.Text>}
                      </Card.Body>
                    </Card>
                        <Row style={{ justifyContent:"space-between", padding: "1.25rem"}}>
                            {flashcards.length == 0 && <Button variant="primary" onClick={() => {this.flashcardAggregator()}}>Begin</Button>}
                            {flashcards.length > 0 && <Button variant="warning" onClick={() => {this.keepStudying()}}>Keep Studying</Button>}
                            {flashcards.length > 0 && <Button variant="primary" onClick={() => {this.flashcardAggregator()}}>Begin</Button>}
                            {flashcards.length > 0 && <Button variant="success" onClick={() => {this.gotIt()}}>Got It!</Button>}
                        </Row>
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default Flashcard
