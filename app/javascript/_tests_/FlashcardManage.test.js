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
    // when the addFlashcard method has been added to FlashcardMangage
    it('should update state with a new flashcard when addFlashcard is called', async () => {
        let props = {
        current_user: { id: 1 }
        }
        postFlashcards.mockImplementation(() => {
            return Promise.resolve(
                {id: 2, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}
            )
        })
        const wrapper = shallow(<FlashcardManage {...props}/>)
        const mockFlashcard = {id: 2, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}
        const expected = [{id: 1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}, mockFlashcard]


        await wrapper.instance().postFlashcard(mockFlashcard)

        expect(postFlashcards).toHaveBeenCalledWith(mockFlashcard)
        expect(wrapper.state('My List')).toEqual(expected)
    })
    // when the deleteFlashcard method has been added to FlashcardMangage
})
