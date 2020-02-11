
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
    User.create_or_find_by!(user)
end


flashcards = [
    # Creates Javascript Methods Flashcard list
    {front: "map()",
    back: "Creates a new array with the result of calling a function for each array element.",
    source: "https://www.w3schools.com/jsref/jsref_map.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "filter()",
    back: "Creates a new array with every element in an array that pass a test.",
    subject: "Javascript Methods",
    source: "https://www.w3schools.com/jsref/jsref_filter.asp",
    user_id: "1"},

    {front: "concat()",
    back: "Joins two or more arrays, and returns a copy of the joined arrays.",
    source: "https://www.w3schools.com/jsref/jsref_concat_array.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "includes()",
    back: "Check if an array contains the specified element.",
    source: "https://www.w3schools.com/jsref/jsref_includes_array.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "join()",
    back: "	Joins all elements of an array into a string.",
    source: "https://www.w3schools.com/jsref/jsref_join.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "pop()",
    back: "	Removes the last element of an array, and returns that element.",
    source: "https://www.w3schools.com/jsref/jsref_pop.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "push()",
    back: "Adds new elements to the end of an array, and returns the new length.",
    source: "https://www.w3schools.com/jsref/jsref_push.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "shift()",
    back: "Removes the first element of an array, and returns that element.",
    source: "https://www.w3schools.com/jsref/jsref_shift.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "slice()",
    back: "Selects a part of an array, and returns the new array.",
    source: "https://www.w3schools.com/jsref/jsref_slice_array.asp",
    subject: "Javascript Methods",
    user_id: "1"},

    {front: "sort()",
    back: "Sorts the elements of an array.",
    source: "https://www.w3schools.com/jsref/jsref_sort.asp",
    subject: "Javascript Methods",
    user_id: "1"},
    # Creates Ruby Methods Flashcard list
    {front: "pop method of an array",
    back: "Removes the last element from self and returns it, or nil if the array is empty.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-pop",
    subject: "Ruby Methods",
    user_id: "1"},

    {front: "concat method of an array",
    back: "Appends the elements of +other_ary+s to self.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-length",
    subject: "Ruby Methods",
    user_id: "1"},

    {front: "push method of an array",
    back: "Append — Pushes the given object(s) on to the end of this array. This expression returns the array itself, so several appends may be chained together.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-push",
    subject: "Ruby Methods",
    user_id: "1"},

    {front: "unshift methd of an array",
    back: "Prepends objects to the front of self, moving other elements upwards. See also #shift for the opposite effect.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-unshift",
    subject: "Ruby Methods",
    user_id: "1"},

    {front: "sort! method of an array",
    back: "Sorts self in place.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-sort-21",
    subject: "Ruby Methods",
    user_id: "1"},
    {front: "each_index method of an array",
    back: "Same as #each, but passes the index of the element instead of the element itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each_index",
    subject: "Ruby Methods",
    user_id: "1"},
    {front: "replace method of an array",
    back: "Replaces the contents of self with the contents of other_ary, truncating or expanding if necessary.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-replace",
    subject: "Ruby Methods",
    user_id: "1"},
    {front: "insert method of an array",
    back: "Inserts the given values before the element with the given index.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-insert",
    subject: "Ruby Methods",
    user_id: "1"},
    {front: "each {|item|block} method of an array",
    back: "Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each",
    subject: "Ruby Methods",
    user_id: "1"},
    # Creates myList Flashcard list
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "While Loop",
    back: "Loop that loops through a block of code as long as a specified condition is true.",
    source: "https://www.w3schools.com/js/js_loop_while.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Function",
    back: "A block of code designed to perform a particular task and is executed when something invokes it (calls it).",
    source: "https://www.w3schools.com/js/js_functions.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Event",
    back: "HTML events are things that happen to HTML elements.",
    source: "https://www.w3schools.com/js/js_events.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Conditional Statements (if/else/else if)",
    back: "They are used to perform different actions based on different conditions.",
    source: "https://www.w3schools.com/js/js_if_else.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "For Loop",
    back: "Execute a block of code a number of times.",
    source: "https://www.w3schools.com/js/js_loop_for.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Primitive Value",
    back: "A value that has no properties or methods.",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Primitive Data Type",
    back: "Data that has a primitive value: string, number, boolean, null, undefined",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Strings",
    back: "Used for storing and manipulating text.",
    source: "https://www.w3schools.com/js/js_strings.asp",
    subject: "MyList",
    user_id: "1"},
    {front: "Array iteration methods ",
    back: "Methods operate on every array item.",
    source: "https://www.w3schools.com/js/js_array_iteration.asp",
    subject: "MyList",
    user_id: "1"}]


flashcards.each do |flashcard|
    pp flashcard
    Flashcard.create_or_find_by!(flashcard)
end

p "Created #{Flashcard.count} Flashcards"
