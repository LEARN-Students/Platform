import React from 'react';
import ReactDOM from 'react-dom';
import Flashcard from '../components/Flashcard';
import FlashcardManage from '../components/FlashcardManage';
import Enzyme, { mount, shallow, render } from 'enzyme';
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() })

it('renders without crashing', () => {
   const wrapper = shallow(<Flashcard />, {disableLifecycleMethods : true})
    //check element on rendered page exists using shallow api:
    //airbnb.io/enzyme/docs/api/shallow.html#shallownode-options--shallowwrapper
        //change contains(...)
        //change toBe(...)
       // expect(wrapper.contains(<p class="card-text"></p>)).toBe("Some quick example text to build on the card title and make up the bulk of the card's content.");
   // expect(wrapper.contains(<div />)).toBe(true)
});
