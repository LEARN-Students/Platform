import React, { Component } from "react"
import { Container, Image, Col, Row } from "react-bootstrap"
import OfreyImage from "images/OfreyBarsheshet.png"
import KristenImage from "images/KristenMulder.png"
import JakeImage from "images/JakeRandall.png"
import MichaelImage from "images/MichaelAbdelshahid.png"
import GithubIcon from "images/githubIcon.png"
import LinkedinIcon from "images/linkedinIcon.png"
import LearnLogo from 'images/learnLogo.png'


class About extends Component {
    render(){
        return(
            <Container>
                <Row id="aboutProject" style={{alignItems:"center", marginBottom:"2rem"}}>
                <Col xs={8}>
                    <h1>About the Project</h1>
                    <p>
                    The LEARN student platform is an open-source collection of modules & resources built to empower students transitioning into a career in programming. In particular, the LEARN student platform aspires to be a comprehensive resource for learning React-on-Rails development and related topics in conjunction with the LEARN academy curriculum.
                    </p>
                    <p>
                    The open source nature of the project is to encourage students & alumni to build out tools and provide resources to support not only their own learning, but of their peers. This project is for LEARN students & built by LEARN students.
                    </p>
                    <p>
                    The LEARN student platform is still in it's infancy and we encourage you to add to the project by contributing code. To learn more about contributing to the project, please visit our <a href="https://github.com/LEARN-Students/Platform">GitHub repo</a>.
                    </p>
                </Col>
                <Col xs={4}>
                    <Image
                        src={LearnLogo}
                        alt="LEARN Academy Logo"
                        fluid />
                </Col>
                </Row>
                <Row id="aboutTeam" style={{alignItems:"center"}}>
                    <Col xs={12}>
                    <h1>Meet the Team</h1>
                    <p>The initial development of the LEARN student platform was completed by the FOXTROT 2020 capstone team of Ofrey Barsheshet, Kristen Mulder, Jake Randall, & Michael Abdelshahid.</p>
                    </Col>
                    <Col id="OfreyBarsheshet" md={3} sm={6} xs={10}>
                        <h4>Ofrey Barsheshet</h4>
                        <Image
                            src={OfreyImage}
                            alt="Image of Ofrey Barsheshet"
                            fluid />
                        <Row>
                            <Col xs={{span:4, offset:2}}>
                                <a href="https://github.com/ofreybar" alt="link to Ofrey Barsheshet's Github page" target="_blank">
                                    <Image
                                        src={GithubIcon}
                                        alt="github icon"
                                        fluid />
                                </a>
                            </Col>
                            <Col xs={4}>
                                <a href="linkedin.com/in/ofreybar" alt="link to Ofrey Barsheshet's LinkedIn page" target="_blank">
                                    <Image
                                        src={LinkedinIcon}
                                        alt="linkedin icon"
                                        fluid />
                                </a>
                            </Col>
                        </Row>
                    </Col>
                    <Col id="KristenMulder" md={3} sm={6} xs={10}>
                        <h4>Kristen Mulder</h4>
                        <Image
                            src={KristenImage}
                            alt="Image of Kristen Mulder"
                            fluid />
                        <Row>
                            <Col xs={{span:4, offset:2}}>
                                <a href="https://github.com/mulderkristen " alt="link to Kristen Mulder's Github page" target="_blank">
                                    <Image
                                        src={GithubIcon}
                                        alt="github icon"
                                        fluid />
                                </a>
                            </Col>
                            <Col xs={4}>
                                <a href="https://www.linkedin.com/in/kristen-mulder-008b68a2/" alt="link to Kristen Mulder's LinkedIn page" target="_blank">
                                    <Image
                                        src={LinkedinIcon}
                                        alt="linkedin icon"
                                        fluid />
                                </a>
                            </Col>
                        </Row>
                    </Col>
                    <Col id="JakeRandall" md={3} sm={6} xs={10}>
                    <h4>Jake Randall</h4>
                    <Image
                        src={JakeImage}
                        alt="Image of Jake Randall"
                        fluid />
                        <Row>
                        <Col xs={{span:4, offset:2}}>
                            <a href="https://github.com/JakeRoyRandall" alt="link to Jake Randall's Github page" target="_blank">
                                <Image
                                    src={GithubIcon}
                                    alt="github icon"
                                    fluid />
                            </a>
                        </Col>
                        <Col xs={4}>
                            <a href="https://www.linkedin.com/in/jake-roy-randall" alt="link to Jake Randall's LinkedIn page" target="_blank">
                                <Image
                                    src={LinkedinIcon}
                                    alt="linkedin icon"
                                    fluid />
                            </a>
                        </Col>
                        </Row>
                    </Col>
                    <Col id="MichaelAbdelshahid" md={3} sm={6} xs={10}>
                        <h4>Michael Abdelshahid</h4>
                        <Image
                            src={MichaelImage}
                            alt="Image of Michael Abdelshahid"
                            fluid />
                        <Row>
                        <Col xs={{span:4, offset:2}}>
                            <a href="https://github.com/mna4642" alt="link to Michael Abdelshahid's Github page" target="_blank">
                                <Image
                                    src={GithubIcon}
                                    alt="github icon"
                                    fluid />
                            </a>
                        </Col>
                        <Col xs={4}>
                            <a href="https://www.linkedin.com/in/mna3531/" alt="link to Michael Abdelshahid's LinkedIn page" target="_blank">
                                <Image
                                    src={LinkedinIcon}
                                    alt="linkedin icon"
                                    fluid />
                            </a>
                        </Col>
                        </Row>
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default About
