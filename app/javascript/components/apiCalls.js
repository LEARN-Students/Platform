export const getFlashcards = () => {
    return fetch('http://localhost:3000/flashcards')
    .then(response => {
        if(!response.ok) {
            throw Error('Error fetching flashcards')
        }
        return response.json()
    })
}
