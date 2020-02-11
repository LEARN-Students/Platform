export const getFlashcards = () => {
    return fetch('http://localhost:3000/flashcards')
    .then(response => {
        if(!response.ok) {
            throw Error('Error fetching flashcards')
        }
        return response.json()
    })
}

export const getMyFlashcards = () => {
    return fetch("http://localhost:3000/flashcards")
        .then(response => {
            if (response.ok) {return response.json()}
            else {throw new Error('Something went wrong ...')}
        })
}

export const postFlashcards = (flashcard) => {
    return fetch('http://localhost:3000/flashcards', {
        body: JSON.stringify(flashcard),  // <- we need to stringify the json for fetch
        headers: {  // <- We specify that we're sending JSON, and expect JSON back
          'Content-Type': 'application/json'
        },
        method: "POST"  // <- Here's our verb, so the correct endpoint is invoked on the server
      })
}

export const deleteFlashcards = (flashcard) => {
    return fetch('http://localhost:3000/flashcards/' + flashcard.id, {
        body: JSON.stringify(flashcard),  // <- we need to stringify the json for fetch
        headers: {  // <- We specify that we're sending JSON, and expect JSON back
          'Content-Type': 'application/json'
        },
        method: "DELETE"  // <- Here's our verb, so the correct endpoint is invoked on the server
      })
}

export const editFlashcards = (flashcard) => {
    return fetch('http://localhost:3000/flashcards/' + flashcard.id, {
        body: JSON.stringify(flashcard),  // <- we need to stringify the json for fetch
        headers: {  // <- We specify that we're sending JSON, and expect JSON back
          'Content-Type': 'application/json'
        },
        method: "PATCH"  // <- Here's our verb, so the correct endpoint is invoked on the server
      })
}
