import React from 'react';
import ReactDOM from 'react-dom';
import App from '../components/App';
import Routes, {About, Home, Flashcard} from '../components/App';
import Enzyme, { mount, shallow, render } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import { NavLink } from 'react-router-dom';
import { MemoryRouter } from 'react-router';
import { Navbar, Nav } from "react-bootstrap"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"


Enzyme.configure({ adapter: new Adapter() });

describe('Test render of app', () => {
    it('renders without crashing', () => {
       const div = document.createElement('div');
       ReactDOM.render(<App />, div);
    });
})

describe('Test navbar buttons', () => {
    test('should route to the right component', () => {
        const wrapper = mount(
            <Router>
                <div>
                    <Nav.Link to="/about" />
                    <Nav.Link to="/flashcards" />
                    <Nav.Link to="/" />
                    <Switch>
                        <Route exact path="/about" component={About} />
                        <Route exact path="/flashcards" component={Flashcard} />
                        <Route exact path="/" component={Home} />
                    </Switch>
                </div>
            </Router>
        )
        const pathMap = wrapper.find(Route).reduce((pathMap, route) => {
            const routeProps = route.props();
            pathMap[routeProps.path] = routeProps.component;
            return pathMap;
          }, {});
        expect(pathMap['/about']).toBe(About)
        expect(pathMap['/flashcards']).toBe(Flashcard)
        expect(pathMap['/']).toBe(Home)
    });
});
