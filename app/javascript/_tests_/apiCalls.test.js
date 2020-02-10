import { getFlashcards } from '../components/apiCalls'
<<<<<<< HEAD
// import { postFlashcards } from '../components/apiCalls'

=======
>>>>>>> 75afa9f6f704eb364325b8431534b5ec9c9b4698

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
<<<<<<< HEAD

//Once post api call is merged, uncomment:

// describe('postFlashcards', () => {
//     let mockFlashcard = [
//         {
//             id:1,
//             front: "test",
//             back: "back of test",
//             source: "source of test",
//             subject: "subject of test",
//             user_id: 1
//         }
//     ]
//     beforeEach(() => {
//         window.fetch = jest.fn().mockImplementation(() => {
//             return Promise.resolve({
//                 ok: true,
//                 json: () => Promise.resolve(mockFlashcard)
//             })
//         })
//     })
//     it('should fetch with the correct arguments', () => {
//         const expected = ['http://localhost:3000/flashcards/manage', {
//             method: 'POST',
//             body: JSON.stringify(mockFlashcard),
//             headers: {
//                 'Content-Type': 'application/json'
//             }
//         }]
//         postFlashcards(mockFlashcard)
//         expect(window.fetch).toHaveBeenCalledWith(...expected)
//     })
// })
=======
>>>>>>> 75afa9f6f704eb364325b8431534b5ec9c9b4698
