import { getFlashcards, postFlashcards, getMyFlashcards, deleteFlashcards, editFlashcards } from '../components/apiCalls'


describe('getFlashcards', () => {
    let mockResponse = [
        {
            id:1,
            front: "test",
            back: "back of test",
            source: "source of test",
            subject: "subject of test",
            user_id: 1
        },
        {
            id:2,
            front: "test 2",
            back: "back of test 2",
            source: "source of test 2",
            subject: "subject of test 2",
            user_id: 1
        }
    ]
    beforeEach(() => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok: true,
                json: () => Promise.resolve(mockResponse)
            })
        })
    })
    // Fetch should be invoked with the right url
    it('should call fetch with the correct url', () => {
        getFlashcards()
        expect(window.fetch).toHaveBeenCalledWith('http://localhost:3000/flashcards')
    })
    // If response is ok, we should have an array of flashcards
    it('should return an array of flashcards', () => {
        expect(getFlashcards()).resolves.toEqual(mockResponse)
    })
    // First error test is for when the fetch resolves but the response is not OK.
    it('should return an error', () => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok:false
            })
        })
        expect(getFlashcards()).rejects.toEqual(Error('Error fetching flashcards'))
    })
    // Second error test is for when a fetch call fails
    it('should return an error if promise rejects', () => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.reject(Error('fetch failed'))
        })
        expect(getFlashcards()).rejects.toEqual(Error('fetch failed'))
    })
})

describe('getMyFlashcards', () => {
    let mockFlashcard = [
        {
            id:1,
            front: "test",
            back: "back of test",
            source: "source of test",
            subject: "myList",
            user_id: 1
        }
    ]
    beforeEach(() => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok: true,
                json: () => Promise.resolve(mockFlashcard)
            })
        })
    })
    it('should call fetch with the correct url', () => {
        getMyFlashcards()
        expect(window.fetch).toHaveBeenCalledWith('http://localhost:3000/flashcards')
    })
    it('should return an array of my flashcards', () => {
        expect(getMyFlashcards()).resolves.toEqual(mockFlashcard)
    })
    // First error test is for when the fetch resolves but the response is not OK.
    it('should return an error', () => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok:false
            })
        })
        expect(getMyFlashcards()).rejects.toEqual(Error('Error fetching flashcards'))
    })
    // Second error test is for when a fetch call fails
    it('should return an error if promise rejects', () => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.reject(Error('fetch failed'))
        })
        expect(getMyFlashcards()).rejects.toEqual(Error('fetch failed'))
    })
})


describe('postFlashcards and editFlashcards', () => {
    let mockFlashcard = [
        {
            id:1,
            front: "test",
            back: "back of test",
            source: "source of test",
            subject: "subject of test",
            user_id: 1
        }
    ]
    beforeEach(() => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok: true,
                json: () => Promise.resolve(mockFlashcard)
            })
        })
    })
    it('should fetch with the correct arguments', () => {
        const expected = ['http://localhost:3000/flashcards', {
            method: 'POST',
            body: JSON.stringify(mockFlashcard),
            headers: {
                'Content-Type': 'application/json'
            }
        }]
        postFlashcards(mockFlashcard)
        expect(window.fetch).toHaveBeenCalledWith(...expected)
    })
    it('should fetch with the correct arguments', () => {
        const expected = ['http://localhost:3000/flashcards/' + mockFlashcard.id, {
            method: 'PUT',
            body: JSON.stringify(mockFlashcard),
            headers: {
                'Content-Type': 'application/json'
            }
        }]
        editFlashcards(mockFlashcard)
        expect(window.fetch).toHaveBeenCalledWith(...expected)
    })
})



describe('deleteFlashcards', () => {
    let mockFlashcard = [
        {
            id:1,
            front: "test",
            back: "back of test",
            source: "source of test",
            subject: "myList",
            user_id: 1
        }
    ]
    beforeEach(() => {
        window.fetch = jest.fn().mockImplementation(() => {
            return Promise.resolve({
                ok: true,
                json: () => Promise.resolve(mockFlashcard)
            })
        })
    })
    it('should fetch with the correct arguments', () => {
        const expected = ['http://localhost:3000/flashcards/' + mockFlashcard.id, {
            method: 'DELETE',
            body: JSON.stringify(mockFlashcard),
            headers: {
                'Content-Type': 'application/json'
            }
        }]
        deleteFlashcards(mockFlashcard)
        expect(window.fetch).toHaveBeenCalledWith(...expected)
    })
})
