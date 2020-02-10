
flashcardCount = Flashcard.count

Flashcard.destroy_all

p "Destroyed #{flashcardCount} Flashcards"

p "#{Flashcard.count} Current Flashcards"

User.destroy_all

Flashcard.destroy_all

users =
    [{email:"talentdivendevelopment@gmail.com", provider:"seed", uid:1, password:"TalentDriven"},
    {email:"123@gmail.com", provider:"seed", uid:999995, password:"123456"},
    {email:"234@gmail.com", provider:"seed", uid:999996, password:"123456"},
    {email:"345@gmail.com", provider:"seed", uid:999997, password:"123456"},
    {email:"456@gmail.com", provider:"seed", uid:999998, password:"123456"},
    {email:"567@gmail.com", provider:"seed", uid:999999, password:"123456"}]

users.each do |user|
    User.create_or_find_by(user)
end


flashcards = [{
    front: "map()",
    back: "Creates a new array with the result of calling a function for each array element",
    source: "https://www.w3schools.com/jsref/jsref_map.asp",
    subject: "Javascript Methods",
    user_id: "1"},
    {front: "filter()",
    back: "Creates a new array with every element in an array that pass a test",
    subject: "Javascript Methods",
    source: "https://www.w3schools.com/jsref/jsref_filter.asp",
    user_id: "1"},
    # Creates Ruby Methods Flashcard list
    {front: "pop method of an array",
    back: "Removes the last element from self and returns it, or nil if the array is empty.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-pop",
    subject: "Ruby Methods",
    user_id: "1"},
    {front: "length method of an array",
    back: "Returns the number of elements in self. May be zero.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-length",
    subject: "Ruby Methods",
    user_id: "1"},
    # Creates myList Flashcard list
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "MyList",
    user_id: "1"}]


flashcards.each do |flashcard|
    pp flashcard
    Flashcard.create_or_find_by(flashcard)
end

p "Created #{Flashcard.count} Flashcards"
