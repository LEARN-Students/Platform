import React from 'react';
import { getFlashcards, getMyFlashcards, postFlashcards } from '../components/apiCalls'
import Enzyme, { shallow } from 'enzyme'
import FlashcardManage from '../components/FlashcardManage'
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() })

jest.mock('../components/apiCalls.js')

describe('FlashcardManage', () => {
    beforeEach(() => {
        getMyFlashcards.mockImplementation(() => {
            return Promise.resolve([{id:1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}])
        })
    })
    it('should retrieve a list of my flashcards after mounting', () => {
        shallow(<FlashcardManage />)
        expect(getMyFlashcards).toHaveBeenCalled()
    })
    //when the addFlashcard method has been added to FlashcardMangage
    it('should update state with a new flashcard when addFlashcard is called', async () => {
        postFlashcard.mockImplementation(() => {
            return Promise.resolve(
                {id: 2, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}
            )
        })
        const wrapper = shallow(<FlashcardManage />)
        const mockFlashcard = {id: 2, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'myList', user_id: 1}
        const expected = [{id: 1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'myList', user_id: 1}, mockFlashcard]

        await wrapper.instance().addFlashcard(mockFlashcard)

        expect(postFlashcard).toHaveBeenCalledWith(mockFlashcard)
        expect(wrapper.state('myList')).toEqual(expected)
    })
    //when the deleteFlashcard method has been added to FlashcardMangage
})
