import React from 'react';
import { getFlashcards, getMyFlashcards, postFlashcards, deleteFlashcards, editFlashcards } from '../components/apiCalls'
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
        let props = {
        current_user: { id: 1 }
        }
        shallow(<FlashcardManage {...props}/>)
        expect(getMyFlashcards).toHaveBeenCalled()
    })
    // when the addFlashcard method has been added to FlashcardMangage
    it('should update state when podtFlashcard is called', async () => {
        let props = {
        current_user: { id: 1 }
        }
        postFlashcards.mockImplementation(() => {
            return Promise.resolve(
                {}
            )
        })
        const wrapper = shallow(<FlashcardManage {...props}/>)
        const mockFlashcard = {id:1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}

        await wrapper.instance().postFlashcard(mockFlashcard)

        expect(postFlashcards).toHaveBeenCalledWith(mockFlashcard)
        expect(getMyFlashcards).toHaveBeenCalledTimes(2)
        // this gets called on initial componentDidMount and when a new card is created.
    })
    it('should update state when deleteFlashcard is called', async () => {
        let props = {
        current_user: { id: 1 }
        }
        deleteFlashcards.mockImplementation(() => {
            return Promise.resolve(
                {}
            )
        })
        const wrapper = shallow(<FlashcardManage {...props}/>)
        const mockFlashcard = {id:1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}

        await wrapper.instance().deleteFlashcard(mockFlashcard)

        expect(deleteFlashcards).toHaveBeenCalledWith(mockFlashcard)
        expect(getMyFlashcards).toHaveBeenCalledTimes(4)
    })
    it('should update state when editFlashcard is called', async () => {
        let props = {
        current_user: { id: 1 }
        }
        editFlashcards.mockImplementation(() => {
            return Promise.resolve(
                {}
            )
        })
        const wrapper = shallow(<FlashcardManage {...props}/>)
        const mockFlashcard = {id:1, front: 'Test', back: 'Back of Test', source: 'Source of Test', subject: 'My List', user_id: 1}

        await wrapper.instance().editFlashcard(mockFlashcard)

        expect(editFlashcards).toHaveBeenCalledWith(mockFlashcard)
        expect(getMyFlashcards).toHaveBeenCalledTimes(5)
    })
})
