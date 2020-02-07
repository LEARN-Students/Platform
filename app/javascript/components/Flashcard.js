import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row } from "react-bootstrap"
import { Link } from "react-router-dom"


// from getData we will get all the flashcards seperated by Subject
//



class Flashcard extends Component {
    constructor(props) {
        super(props);
        this.state = {
            subjects: ["Javascript (Basics)", "Javascript (Adv.)", "Javascript Methods", "Ruby (Basics)", "Ruby (Adv.)", "Ruby Methods", "React (Basics)", "Rails (Basics)"],
            flashcards: [],
            error: "",
            // true boolean represents front, false boolean represents back
            flashcardSide: true,
            js: false,
            jsFC:[],
            jsAdv: false,
            jsAdvFC:[],
            jsMethods: false,
            jsMethodsFC:[],
            ruby: false,
            rubyFC:[],
            rubyAdv: false,
            rubyAdvFC:[],
            rubyMethods: false,
            rubyMethodsFC:[],
            react:false,
            reactFC:[],
            rails:false,
            railsFC:[],
            myList:false,
            myListFC:[],
        }
    }

<<<<<<< HEAD
    componentDidMount = () => {
    // function will need to fetch data from our JSON API
    // we should seperate the data by subject so we can xport just what me need
        fetch("http://localhost:3000/flashcards")
            .then((response) => {
                console.log(response)
                console.log(response.status)
                if(response.status == 200) {
                    return(response.json())
                }
            })
            .then((flashcardsArray) => {
                let subjects = [...new Set(flashcardsArray.map(item => item.subject))];
                this.setState({subjects:subjects})
                let js = flashcardsArray.filter(fc => fc.subject === "Javascript (Basics)")
                this.setState({jsFC: js})
                let jsAdv = flashcardsArray.filter(fc => fc.subject === "Javascript (Adv.)")
                this.setState({jsAdvFC: jsAdv})
                let jsMethods = flashcardsArray.filter(fc => fc.subject === "Javascript Methods")
                this.setState({jsMethodsFC: jsMethods})
                let ruby = flashcardsArray.filter(fc => fc.subject === "Ruby (Basics)")
                this.setState({rubyFC: ruby})
                let rubyAdv = flashcardsArray.filter(fc => fc.subject === "Ruby (Adv.)")
                this.setState({rubyAdvFC: rubyAdv})
                let rubyMethods = flashcardsArray.filter(fc => fc.subject === "Ruby Methods")
                this.setState({rubyMethodsFC: rubyMethods})
                let react = flashcardsArray.filter(fc => fc.subject === "React (Basics)")
                this.setState({reactFC: react})
                let rails = flashcardsArray.filter(fc => fc.subject === "Rails (Basics)")
                this.setState({railsFC: rails})
                let myList = flashcardsArray.filter(fc => fc.subject === "My List")
                this.setState({myListFC: myList})
            })
            .catch((error)=>{
                this.setState({ error: `Error: ${error.message}`})
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
        let { flashcards,
            js, jsFC,
            jsAdv, jsAdvFC,
            jsMethods, jsMethodsFC,
            ruby, rubyFC,
            rubyAdv, rubyAdvFC,
            rubyMethods, rubyMethodsFC,
            react, reactFC,
            rails, railsFC,
            myList, myListFC
        } = this.state
        // Setting a new array to aggregate the active flashcards
        let aggArray = []
        // Reset the state of flashcards to empty
        this.setState({flashcards: aggArray})
        // Checks if the user has checked the box (boolean true/false)
        // & puts the flashcards from the lists in state into the empty array
        // if the value of javascript stored in state is true
        if(js){jsFC.map(flashcard => aggArray.push(flashcard))}
        if(jsAdv){jsAdvFC.map(flashcard => aggArray.push(flashcard))}
        if(jsMethods){jsMethodsFC.map(flashcard => aggArray.push(flashcard))}
        if(ruby){rubyFC.map(flashcard => aggArray.push(flashcard))}
        if(rubyAdv){rubyAdvFC.map(flashcard => aggArray.push(flashcard))}
        if(rubyMethods){rubyMethodsFC.map(flashcard => aggArray.push(flashcard))}
        if(react){reactFC.map(flashcard => aggArray.push(flashcard))}
        if(rails){railsFC.map(flashcard => aggArray.push(flashcard))}
        if(myList){myListFC.map(flashcard => aggArray.push(flashcard))}
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

    // for use when we map through our subjects object to make checkboxes
    checkbox = (subject) => {
        console.log(subject);
    }

    render(){
        let { flashcards, subjects,
            error, flashcardSide,
            js, jsFC,
            jsAdv, jsAdvFC,
            jsMethods, jsMethodsFC,
            ruby, rubyFC,
            rubyAdv, rubyAdvFC,
            rubyMethods, rubyMethodsFC,
            react, reactFC,
            rails, railsFC,
            myList, myListFC
        } = this.state
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
                            {/*}{subjects.map(subject => {
                                return(
                                    <Form.Check
                                    style={{ marginBottom:".5rem" }}
                                    type="checkbox"
                                    label={subject}
                                    onClick={() => {this.checkbox(subject)}}
                                    />
                            )})}*/}
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Javascript (Basics)"
                                onClick={() => {this.setState({js:!js})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Javascript (Adv.)"
                                onClick={() => {this.setState({jsAdv:!jsAdv})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Javascript Methods"
                                onClick={() => {this.setState({jsMethods:!jsMethods})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Ruby (Basics)"
                                onClick={() => {this.setState({ruby:!ruby})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Ruby (Adv.)"
                                onClick={() => {this.setState({rubyAdv:!rubyAdv})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Ruby Methods"
                                onClick={() => {this.setState({rubyMethods:!rubyMethods})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="React (Basics)"
                                onClick={() => {this.setState({react:!react})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="Rails (Basics)"
                                onClick={() => {this.setState({rails:!rails})}}
                                />
                                <Form.Check
                                style={{ marginBottom:".5rem" }}
                                type="checkbox"
                                label="My List"
                                onClick={() => {this.setState({myList:!myList})}}
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
                            {flashcards.length > 0 && <Button variant="primary" onClick={() => {this.flashcardAggregator()}}>Reset</Button>}
                            {flashcards.length > 0 && <Button variant="success" onClick={() => {this.gotIt()}}>Got It!</Button>}
                        </Row>
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default Flashcard
