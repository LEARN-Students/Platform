import React from 'react';
import { getFlashcards } from '../components/apiCalls'
import Enzyme, { shallow } from 'enzyme'
import Flashcard from '../components/Flashcard'
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() })

jest.mock('../components/apiCalls.js')

describe('Flashcard', () => {
    beforeEach(() => {
        getFlashcards.mockImplementation(() => {
            return Promise.resolve([{id:1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'Subject of Test', user_id: 1}])
        })
    })
    it('should retrieve flashcards after mounting', () => {
        shallow(<Flashcard />)
        expect(getFlashcards).toHaveBeenCalled()
    })
})
