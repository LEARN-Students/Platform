import React, { Component } from "react"
import { Button, Card, Form, Container, Col, Row } from "react-bootstrap"
import { Link } from "react-router-dom"
import { getFlashcards } from './apiCalls.js'
import ReactCardFlip from 'react-card-flip'

class Flashcard extends Component {
    constructor(props) {
        super(props);
        this.state = {
            subjects: [],
            flashcardArrays: {},
            flashcards: [],
            error: "",
            // true boolean represents front, false boolean represents back
            isFlipped: true,
            subjectBooleans: {}
        }
    // this.flipCard = this.flipCard.bind(this);
    }

    componentDidMount = () => {
    // function will need to fetch data from our JSON API
    // we should seperate the data by subject so we can xport just what me need
        const { subjects, flashcardArrays } = this.state
        getFlashcards()
            .then((flashcardsArray) => {
                //mapping through all flashcards and return an array of all flashcard subjects then getting a set from them (a set is a list/array of unique values).
                var newSubjectArray = [...new Set(flashcardsArray.map(flashcard => flashcard.subject))]
                //Then you set that to subjects in state.
                this.setState({subjects: newSubjectArray})
                return flashcardsArray
            })
            .then((flashcardsArray) => {
                //setting the variable of objects as an empty object
                var object = {}
                //mapping through all flashcards and return an array of all flashcard subjects then getting a set from them (a set is a list/array of unique values).
                var newSubjectArray = [...new Set(flashcardsArray.map(flashcard => flashcard.subject))]
                //for each subject create an array of subjects that correspond to that subject.
                newSubjectArray.forEach(flashcardSubject => {
                    if (flashcardSubject === "My List" ) {
                        let flashcardArray = flashcardsArray.filter(flashcard =>
                            flashcard.user_id === this.props.current_user.id)
                        object[flashcardSubject] = flashcardArray
                    }
                    else {
                        let flashcardArray = flashcardsArray.filter(flashcard => flashcard.subject === flashcardSubject)
                        object[flashcardSubject] = flashcardArray
                    }
                    //Create a new key in our objects of the subjects and set a value to that key to the flashcard array created above.
                    // object[flashcardSubject] = flashcardArray
            })
                this.setState({flashcardArrays: object})
                return flashcardsArray
            })
            // .then((flashcardsArray) => {
            //     var array = flashcardsArray.filter(flashcard => flashcard.user_id === this.props.current_user.id)
            //     var newObject = this.state.flashcardArrays
            //     newObject['My List'] = array
            //     this.setState({ flashcardArrays: newObject })
            //     return flashcardsArray
            // })
            .then((flashcardsArray) => {
                //setting the variable of objects as an empty object
                var object = {}
                //mapping through all flashcards and return an array of all flashcard subjects then getting a set from them (a set is a list/array of unique values).
                var newSubjectArray = [...new Set(flashcardsArray.map(flashcard => flashcard.subject))]
                newSubjectArray.forEach(flashcardSubject => {
                    //Create a new key in our objects of the subjects and set a value to false.
                    object[flashcardSubject] = false
            })
                this.setState({subjectBooleans: object})
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
    }

    flashcardAggregator = () => {
        // Destructuring our variables
        let { flashcards, flashcardArrays, subjectBooleans } = this.state
        // Setting a new array to aggregate the active flashcards
        let aggArray = []
        // Reset the state of flashcards to empty
        this.setState({flashcards: aggArray})
        //Creating a variable with an empty array
        var checkedSubjects = []
        //iterating through subjectBooleans object, for each subject if the subjectBoolean key of subject is true, then push the subject into the checkedSubjects array
        for(var subject in subjectBooleans) {
            if(subjectBooleans[subject]) {
                checkedSubjects.push(subject)
            }
        }
        //iterate through flashcardArrays for each subject, if subject is included in the checkedSubjects array then for each flashcard in the flashcardArrays[subject] array push to our aggregator array
        for(var subject in flashcardArrays) {
            if(checkedSubjects.includes(subject)) {
                flashcardArrays[subject].forEach(flashcard => aggArray.push(flashcard))
            }
        }
        this.shuffle(aggArray)
    }

    gotIt = () => {
        const { flashcards } = this.state
        this.setState({flashcards: flashcards.slice(1), isFlipped: true})
    }

    keepStudying = () => {
        const { flashcards } = this.state
        var array = flashcards
        var curFC = array.shift()
        array = array.concat(curFC);
        this.setState({flashcards: array})
    }

    //Provides checkbox functionality
    checkbox = (subject) => {
        //destructuring subjectBooleans form state
        const { subjectBooleans } = this.state
        //setting newObject to the value of subjectBooleans
        var newObject = subjectBooleans
        //Finding the value of the key in the subjectBoolean object of the subject we passed in and setting it to the variable value
        var value = subjectBooleans[subject]
        //Set the key in the subjectBoolean of the subject we passed in to the opposite of the variable value
        newObject[subject] = !value
        //Setting subjectBoolean to the newly created object
        this.setState({subjectBooleans: newObject})
        // console.log(subjectBooleans);
        // console.log(this.state.flashcardArrays);
    }

    flipCard = (e) => {
        const { isFlipped } = this.state
        e.preventDefault()
        this.setState({isFlipped: !isFlipped})
    }

    render(){
        const { flashcards, subjects,
            error, isFlipped, flashcardArrays
        } = this.state
        return(
            <Container>
                <Row>
                    <Col sm={4}>
                        <Card>
                          <Card.Header style={{fontSize:"2rem"}}>Subjects</Card.Header>
                          <Card.Body>
                            <Card.Text>
                            <Form>
                            {Object.keys(flashcardArrays).map(subject => {
                                return(
                                    <Row>
                                    <Col xs={10}>
                                    <Form.Check
                                    style={{ marginBottom:".5rem", fontSize:"1.25rem" }}
                                    type="checkbox"
                                    label={subject}
                                    onClick={() => {this.checkbox(subject)}}
                                    />
                                    </Col>
                                    <Col style={{display:"flex", justifyContent:"flex-end", fontSize:"1rem" }}>
                                    {flashcardArrays[subject].length}
                                    </Col>
                                    </Row>
                            )})}
                            </Form>
                            </Card.Text>
                            <Link to="/flashcards/manage">
                              <Button variant = "primary"> Manage My List! </Button>
                            </Link>
                          </Card.Body>
                        </Card>
                    </Col>
                    <Col sm={8}>
                    {flashcards.length > 0 &&<h4 style={{display:"flex", justifyContent:"center"}}>1 / {flashcards.length}</h4>}
                    {flashcards.length == 0 && <Card style={{ width: "100%" }}>
                        <Card.Body>
                        <Card.Title style={{fontSize:"2rem"}}>Get Started:</Card.Title>
                        <Card.Text style={{fontSize:"1.25rem"}}>
                            Please check one or more of the subjects to the left and click begin to start studying! Alternatively, you can curate your own set of flashcards by clicking the "Manage My List" button on the left.
                        </Card.Text>
                        </Card.Body>
                        </Card>}
                    {flashcards.length > 0 &&
                        <ReactCardFlip isFlipped={isFlipped} infinite={true} flipDirection="horizontal" flipSpeedBackToFront={.2} flipSpeedFrontToBack={.2}>
                        <Container>
                            <Card style={{ width: "100%", height:"40vH"}} onClick={ this.flipCard}>
                            <Card.Body style={{display:"flex", justifyContent:"space-between", flexDirection:"column"}}>
                            <Card.Text style={{fontSize:"3.5rem", display:"flex", justifyContent:"center"}}>{flashcards[0].front}</Card.Text>
                            <Row>
                                <Col>
                                {flashcards[0].source !== "" &&
                                <Button variant="primary" onClick={() => {window.open(flashcards[0].source)}}>Source
                                </Button>}
                                </Col>
                                <Col><Card.Text style={{display:"flex", justifyContent:"flex-end", fontSize:"1.5em"}} > {flashcards[0].subject}</Card.Text></Col>
                                </Row>
                            </Card.Body>
                            </Card>
                            </Container>
                            <Container>
                            <Card style={{ width: "100%", height:"40vH"}} onClick={ this.flipCard}>
                            <Card.Body style={{display:"flex", justifyContent:"space-between", flexDirection:"column"}}>
                            <Card.Text style={{fontSize:"2rem"}}>{flashcards[0].back}</Card.Text>
                            <Row><Col>
                                <Button variant="primary" onClick={() => {window.open(flashcards[0].source)}}>Source</Button>
                                </Col>
                                <Col>
                                    <Card.Text style={{display:"flex", justifyContent:"flex-end", fontSize:"1.5em"}} > {flashcards[0].subject}</Card.Text>
                                </Col></Row>
                            </Card.Body>
                            </Card>
                            </Container>
                        </ReactCardFlip>}
                        {flashcards.length == 0 && <Row style={{ justifyContent:"space-between", padding: "1.25rem"}}><Button variant="primary" onClick={() => {this.flashcardAggregator()}}>Begin</Button></Row>}
                        {flashcards.length > 0 && <Row style={{ justifyContent:"space-between", padding: "1.25rem"}}> <Button variant="warning" onClick={() => {this.keepStudying()}}>Keep Studying</Button>
                        <Button variant="primary" onClick={() => {this.flashcardAggregator()}}>Reset</Button>
                        <Button variant="success" onClick={() => {this.gotIt()}}>Got It!</Button></Row>}
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default Flashcard
