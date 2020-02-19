# TODO: Move FC Lists into seperate files and import for better management!

# The seeds.rb file is used to "seed" data for any new database

# Let's ensure the database is nice & empty!

# Clear out Users
p "#{User.count} Current Users"
userCount = User.count
p "Deleting Users!"
User.destroy_all
p "Deleted #{userCount} Users"

# Clear out Flashcards
p "#{Flashcard.count} Current Flashcards"
flashcardCount = Flashcard.count
p "Deleting Flashcards!"
Flashcard.destroy_all
p "Deleted #{flashcardCount} Flashcards"

# Lets create new Users

# Sets a default list of users to a user variable.
# This default list ensures TestDrivenDevelopment@gmail.com has user id 1
users = [
    {email:"talentdrivendevelopment@gmail.com", provider:"seed", uid:1, password:"Password7"}]

# For each user object in the users variable
# we should try to create a new instance if they cannot be found in the database
# the bang operator tells the method to display the full error message on error
users.each do |user|
    User.create_or_find_by!(user)
end

p "Created #{User.count} Users"

# Lets create new Flashcards

# Sets a default list of flashcards to a flashcards variable.
# Each subsection represents a new default set of flashcards ordered by subject
flashcards = [
    # Javascript (Basics)
    {subject: "Javascript (Basics)", front: "Primitive Data Type", back: "Data that has a primitive value: string, number, boolean, null, undefined", source: "https://www.w3schools.com/js/js_object_definition.asp"},

    {subject: "Javascript (Basics)", front: "console.log()", back: "Method to display data that's useful for debugging", source: "https://www.w3schools.com/js/js_output.asp"},

    {subject: "Javascript (Basics)", front: "Strings", back: "We can store words or other characters in JavaScript by surrounding characters with quotation marks", source: "https://www.w3schools.com/js/js_strings.asp"},

    {subject: "Javascript (Basics)", front: "Concatenation vs. String Interpolation", back: "When we use the + on strings it combines the strings in a process called concatenation and when we use ` ${variableName} ` we can combine strings and variables in a process called string interpolation", source: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals"},

    {subject: "Javascript (Basics)",front: "Boolean", back: "Boolean expressions in JavaScript return true or false and even though true and false are words they are not strings, they represent the value of true/false", source: "https://www.w3schools.com/js/js_booleans.asp"},

    {subject: "Javascript (Basics)",front: "Comparison Operator", back: "Comparison operators will return a Boolean value and these include ==, ===
    ", source: "https://www.w3schools.com/js/js_operators.asp"},

    {subject: "Javascript (Basics)", front: "Relational Operator", back: "Comparison operators will return a Boolean value and these include >, <, >=, <=
    ", source: "https://www.w3schools.com/js/js_operators.asp"},

    {subject: "Javascript (Basics)", front: "Logical Operator", back: "Logical operators can return any type of data but uses the principle of Boolean data type to determine the outcome and these include &&, ||, ! (not)
    ", source: "https://www.w3schools.com/js/js_operators.asp"},

    {subject: "Javascript (Basics)", front: "Undefined", back: "If a variable is created but not assigned a value, the variable is undefined", source: "https://www.w3schools.com/js/js_datatypes.asp"},

    {subject: "Javascript (Basics)",front: "Null", back: "Null is equal to nothing else in your program but it is not zero or false", source: "https://www.w3schools.com/js/js_datatypes.asp"},

    {subject: "Javascript (Basics)", front: "Symbol", back: "Symbol is a new data type created for the JS update ECMAScript 2015, symbols are unique and immutable, used for the key in a JS object", source: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures"},

    {subject: "Javascript (Basics)", front: "Type Coercion", back: "If we combine data from different types, JS tries to be helpful and make sense of the operation but can lead to odd behavior like false * 9 giving the output of 0", source: "https://developer.mozilla.org/en-US/docs/Glossary/Type_coercion"},

    {subject: "Javascript (Basics)",front: "Variables", back: "Variables are used to store information and must be declared and assigned a value using a single equals sign", source: "https://www.w3schools.com/js/js_variables.asp"},

    {subject: "Javascript (Basics)",front: "If/Else statement", back: "All conditionals must have an if statement and will run the code if any of the if statement or else if statements run true  else statement if all conditions are false", source: "https://www.w3schools.com/js/js_if_else.asp"},

    {subject: "Javascript (Basics)", front: "Array Destructuring", back: "Array destructuring allows us to assign values from an array to variables", source: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment"},

    {subject: "Javascript (Basics)", front: "Accessor Methods", back: "Also known as getters - methods that access an array and do not change the original array", source: "https://www.w3schools.com/js/js_object_accessors.asp"},

    {subject: "Javascript (Basics)", front: "Mutator Methods", back: "Also know as setters - methods that change the original array", source: "https://www.w3schools.com/js/js_object_accessors.asp"},

    {subject: "Javascript (Basics)", front: "For Loop", back: "Allows you to iterate over items by defining the index start, amount of iterations, and what to do after each loop", source: "https://www.w3schools.com/js/js_loop_for.asp"},

    {subject: "Javascript (Basics)", front: "Global Scope", back: "Variables that can be seen and used anywhere in the program, typically with var or const", source: "https://www.w3schools.com/js/js_scope.asp"},

    {subject: "Javascript (Basics)", front: "Local Scope", back: "Also know as lexical or block scope where ariables in local scope can only be used within the block/function/loop that it is assigned, typically with let", source: "https://www.w3schools.com/js/js_scope.asp"},

    {subject: "Javascript (Basics)", front: "Function", back: "A block of code designed to perform a task and always are assigned to a variable with a name, a set of parantheses that take arguments, instructions and a return statement", source: "https://www.w3schools.com/js/js_functions.asp"},

    {subject: "Javascript (Basics)", front: "Arguments", back: "Pieces of outside information that is used when a function runs", source: "https://www.w3schools.com/js/js_functions.asp"},

    {subject: "Javascript (Basics)", front: "ES6 syntax", back: "The primary way to write a function in Javascript, with a fat arrow and curly braces", source: "https://www.w3schools.com/js/js_es6.asp"},

    {subject: "Javascript (Basics)", front: "Pseudo Code", back: "All the logical steps of your code written out using // and is intended for human reading", source: "https://www.vikingcodeschool.com/software-engineering-basics/what-is-pseudo-coding"},

    {subject: "Javascript (Basics)", front: "Higher-Order Functions", back: "A higher-order function is simply a function that either takes in another function as an argument or returns another function", source: "https://www.freecodecamp.org/news/a-quick-intro-to-higher-order-functions-in-javascript-1a014f89c6b/"},


# Javascript (Adv.)
    {front: "Boolean prototype Constructor",
    back: "A constructor that allows you to add new properties and methods to JavaScript booleans.",
    source: "https://www.w3schools.com/jsref/jsref_prototype_boolean.asp",
    subject: "Javascript (Adv.)"},
    {front: "Array constructor Property",
    back: "The constructor property returns the constructor function for an object.",
    source: "https://www.w3schools.com/jsref/jsref_constructor_array.asp",
    subject: "Javascript (Adv.)"},
    {front: "Array length Property",
    back: "Property sets or returns the number of elements in an array.",
    source: "https://www.w3schools.com/jsref/jsref_length_array.asp",
    subject: "Javascript (Adv.)"},
    {front: "Closure",
    back: "A function having access to the parent scope, even after the parent function has closed.",
    source: "https://www.w3schools.com/js/js_function_closures.asp",
    subject: "Javascript (Adv.)"},
    {front: "Class super Keyword",
    back: "super() refers to the parent class",
    source: "https://www.w3schools.com/jsref/jsref_class_super.asp",
    subject: "Javascript (Adv.)"},
    {front: "Class extends Keyword",
    back: "Used to create a child class of another class (parent).",
    source: "https://www.w3schools.com/jsref/jsref_class_extends.asp",
    subject: "Javascript (Adv.)"},
    {front: "Class constructor Method",
    back: "constructor() method is a special method for creating and initializing objects created within a class.",
    source: "https://www.w3schools.com/jsref/jsref_constructor_class.asp",
    subject: "Javascript (Adv.)"},
    {front: "JavaScript Object Notation (JSON)",
    back: "A format for storing and transporting. It is often used when data is sent from a server to a web page.",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)"},
    {front: "JSON Objects",
    back: "Objects written inside curly braces.",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)"},
    {front: "JSON Arrays",
    back: "arrays are written inside square brackets",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)"},

# Javascript Methods Flashcard list
    {front: "map()",
    back: "The .map() function iterates through an array and returns a new array of the same length",
    source: "https://www.w3schools.com/jsref/jsref_map.asp",
    subject: "Javascript Methods"},
    {front: "filter()",
    back: "The .filter() function loops through an array and returns a new array with only the values that are truthy or the values that satisfy your stated condition and is a subset of the given array",
    subject: "Javascript Methods",
    source: "https://www.w3schools.com/jsref/jsref_filter.asp"},
    {front: "reduce()",
    back: "The .reduce() function loops through an array and returns a single value",
    subject: "Javascript Methods",
    source: "https://www.w3schools.com/jsref/jsref_reduce.asp"},
    {front: "concat()",
    back: "Joins two or more arrays, and returns a copy of the joined arrays",
    source: "https://www.w3schools.com/jsref/jsref_concat_array.asp",
    subject: "Javascript Methods"},
    {front: "includes()",
    back: "Check if an array contains the specified element",
    source: "https://www.w3schools.com/jsref/jsref_includes_array.asp",
    subject: "Javascript Methods"},
    {front: "join()",
    back: "	Joins all elements of an array into a string",
    source: "https://www.w3schools.com/jsref/jsref_join.asp",
    subject: "Javascript Methods"},
    {front: "pop()",
    back: "	Removes the last element of an array, and returns that element",
    source: "https://www.w3schools.com/jsref/jsref_pop.asp",
    subject: "Javascript Methods"},
    {front: "push()",
    back: "Adds new elements to the end of an array, and returns the new length",
    source: "https://www.w3schools.com/jsref/jsref_push.asp",
    subject: "Javascript Methods"},
    {front: "shift()",
    back: "Removes the first element of an array, and returns that element",
    source: "https://www.w3schools.com/jsref/jsref_shift.asp",
    subject: "Javascript Methods"},
    {front: "slice()",
    back: "Selects a part of an array, and returns the new array",
    source: "https://www.w3schools.com/jsref/jsref_slice_array.asp",
    subject: "Javascript Methods"},
    {front: "sort()",
    back: "Sorts the elements of an array",
    source: "https://www.w3schools.com/jsref/jsref_sort.asp",
    subject: "Javascript Methods"},
    {front: "indexOf()",
    back: "Searches the array for the specified item, and returns its position or -1 if it is not found",
    source: "https://www.w3schools.com/jsref/jsref_indexof_array.asp",
    subject: "Javascript Methods"},
    {front: "findIndex()",
    back: "Returns the index of the first element in an array or -1 if it is not found",
    source: "https://www.w3schools.com/jsref/jsref_findindex.asp",
    subject: "Javascript Methods"},
    {front: "reverse()",
    back: "Reverses the order of elements in an array",
    source: "https://www.w3schools.com/jsref/jsref_reverse.asp",
    subject: "Javascript Methods"},
    {front: "lastIndexOf()",
    back: "Searches the array for the specified item starting at the end unless specified, and returns its position or -1 if it is not found",
    source: "https://www.w3schools.com/jsref/jsref_lastindexof_array.asp",
    subject: "Javascript Methods"},


# Ruby (Basics)
    {front: "def",
    back: "Keyword begins the header of the method",
    source: "https://www.learnrubyonline.org/en/Methods",
    subject: "Ruby (Basics)"},
    {front: "puts/p",
    back: "Print something to the console so the user can see it",
    source: "https://www.learnrubyonline.org/en/Hello_World",
    subject: "Ruby (Basics)"},
    {front: "=begin",
    back: "Newline added by Ruby when the users use the 'puts' keyword",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)"},
    {front: "=end",
    back: "How to end multi-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)"},
    {front: "#",
    back: "How to start a single-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)"},
    {front: "Hashes",
    back: "Just like arrays, hashes allow you to store multiple values together. However, while arrays store values with a numerical index, hashes store information using key-value pairs",
    source: "https://www.learnrubyonline.org/en/Variables_and_Types",
    subject: "Ruby (Basics)"},
    {front: "While statements",
    back: "Repeat a block of code as long as a condition is true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)"},
    {front: "Until statements",
    back: "The opposite of while statements; they repeat until a condition becomes true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)"},
    {front: "Unless statement",
    back: "Structured similarly to an if statement, but it will only be done if the condition is false",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)"},

# Ruby (Adv.)
    {front: "Modules",
    back: "A way of grouping together methods, classes, and constants and it give you two major benefits: provide a namespace and prevent name clashes and implement the mixin facility",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html",
    subject: "Ruby (Adv.)"},
    {front: "Yield Statement",
    back: "Method can then invoke the block one or more times",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/intro.html",
    subject: "Ruby (Adv.)"},
    {front: "Initialize",
    back: "Method in ruby programs that store the values as instance variables within the object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Inheritance",
    back: "Allows you to create a class that is a refinement or specialization of another class",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Attributes",
    back: "Defined the methods that let you access and manipulate the state of an object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Class Variables",
    back: "shared among all objects of a class, and it is also accessible to the class methods",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Public methods ",
    back: "Can be called by anyone---there is no access control. Methods are public by default (except for initialize, which is always private)",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Protected methods",
    back: "Can be invoked only by objects of the defining class and its subclasses. Access is kept within the family",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Private methods",
    back: "Object cannot be specified and called with an explicit receiver because it can be called only in the defining class and by direct descendents within that same object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)"},
    {front: "Blocks",
    back: "Used to define a chunk of code that must be run under some kind of transactional control",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_containers.html",
    subject: "Ruby (Adv.)"},

# Ruby Methods Flashcard list
    {front: "pop method of an array",
    back: "Removes the last element from self and returns it, or nil if the array is empty.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-pop",
    subject: "Ruby Methods"},
    {front: "concat method of an array",
    back: "Appends the elements of +other_ary+s to self.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-length",
    subject: "Ruby Methods"},
    {front: "push method of an array",
    back: "Append — Pushes the given object(s) on to the end of this array. This expression returns the array itself, so several appends may be chained together.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-push",
    subject: "Ruby Methods"},
    {front: "unshift methd of an array",
    back: "Prepends objects to the front of self, moving other elements upwards. See also #shift for the opposite effect.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-unshift",
    subject: "Ruby Methods"},
    {front: "sort! method of an array",
    back: "Sorts self in place.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-sort-21",
    subject: "Ruby Methods"},
    {front: "each_index method of an array",
    back: "Same as #each, but passes the index of the element instead of the element itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each_index",
    subject: "Ruby Methods"},
    {front: "replace method of an array",
    back: "Replaces the contents of self with the contents of other_ary, truncating or expanding if necessary.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-replace",
    subject: "Ruby Methods"},
    {front: "insert method of an array",
    back: "Inserts the given values before the element with the given index.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-insert",
    subject: "Ruby Methods"},
    {front: "each {|item|block} method of an array",
    back: "Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each",
    subject: "Ruby Methods"},

# Rails (Basics) Flashcard List
    {front: "Ruby on Rails",
    back: "Ruby on Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)"},
    {front: "Model Layer",
    back: "Represents the domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic specific to your application. ",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)"},
    {front: "Controller Layer",
    back: "Responsible for handling incoming HTTP requests and providing a suitable response",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)"},
    {front: "View Layer",
    back: "Composed of “templates” that are responsible for providing appropriate representations of your application's resources",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)"},
    {front: "Migration",
    back: "Manage the evolution of a schema used by several physical databases",
    source: "api.rubyonrails.org/classes/ActiveRecord/Migration.html",
    subject: "Rails (Basics)"},
    {front: "Parameters()/params()",
    back: "Returns both GET and POST parameters in a single hash",
    source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
    subject: "Rails (Basics)"},
    {front: "path_parameters()",
    back: "Returns a hash with the parameters used to form the path of the request",
    source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
    subject: "Rails (Basics)"},
    {front: "Router",
    back: "Recognizes URLs and dispatches them to a controller's action, or to a Rack application. It can also generate paths and URLs, avoiding the need to hardcode strings in your views.",
    source: "https://guides.rubyonrails.org/routing.html#the-purpose-of-the-rails-router.",
    subject: "Rails (Basics)"},
    {front: "HTTP Verb",
    back: "(3GET, POST, PATCH, PUT and DELETE) Each method is a request to perform an operation on the resource. A resource route maps a number of related requests to actions in a single controller.",
    source: "https://guides.rubyonrails.org/routing.html#http-verb-constraints",
    subject: "Rails (Basics)"},
    {front: ":param",
    back: "Option overrides the default resource identifier :id (name of the dynamic segment used to generate the routes).",
    source: "https://guides.rubyonrails.org/routing.html#using-as-in-nested-resources",
    subject: "Rails (Basics)"},

# React (Basics) Flashcard List
    {front: "React",
    back: "A declarative, efficient, and flexible JavaScript library for building user interfaces",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)"},
    {front: "Components”",
    back: "Compose complex UIs from small and isolated pieces of code.We use components to tell React what we want to see on the screen. When our data changes, React will efficiently update and re-render our components. ",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)"},
    {front: "render() Method",
    back: "Returns a description of what you want to see on the screen. React takes the description and displays the result.",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)"},
    {front: "map() Method",
    back: "Commonly used for mapping data to other data",
    source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
    subject: "React (Basics)"},
    {front: "Constructor",
    back: "Initalize the state of the class",
    source: "https://reactjs.org/tutorial/tutorial.html#making-an-interactive-component",
    subject: "React (Basics)"},
    {front: "Properties/props ",
    back: "Parameters taken in and returns a hierarchy of views to display via the render method by the component of the class",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)"},
    {front: "React Element",
    back: "Are first-class JavaScript objects that can be passed around in the applications and the array is used to renders multiple items in React",
    source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
    subject: "React (Basics)"},
    {front: "Function Components",
    back: "A simpler way to write components that only contain a render method and don’t have their own state",
    source: "https://reactjs.org/tutorial/tutorial.html#function-components",
    subject: "React (Basics)"},
    {front: ".slice()",
    back: " Create a new copy of an array after every move, and treated it as immutable",
    source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
    subject: "React (Basics)"},
    {front: "Immutability",
    back: "Makes complex features much easier to implement by the ability to undo and redo certain actions is a common requirement in applications",
    source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
    subject: "React (Basics)"},

# My List Flashcard list
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "My List"},
    {front: "While Loop",
    back: "Loop that loops through a block of code as long as a specified condition is true.",
    source: "https://www.w3schools.com/js/js_loop_while.asp",
    subject: "My List"},
    {front: "Function",
    back: "A block of code designed to perform a particular task and is executed when something invokes it (calls it).",
    source: "https://www.w3schools.com/js/js_functions.asp",
    subject: "My List"},
    {front: "Event",
    back: "HTML events are things that happen to HTML elements.",
    source: "https://www.w3schools.com/js/js_events.asp",
    subject: "My List"},
    {front: "Conditional Statements (if/else/else if)",
    back: "They are used to perform different actions based on different conditions.",
    source: "https://www.w3schools.com/js/js_if_else.asp",
    subject: "My List"},
    {front: "For Loop",
    back: "Execute a block of code a number of times.",
    source: "https://www.w3schools.com/js/js_loop_for.asp",
    subject: "My List"},
    {front: "Primitive Value",
    back: "A value that has no properties or methods.",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "My List"},
    {front: "Primitive Data Type",
    back: "Data that has a primitive value: string, number, boolean, null, undefined",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "My List"},
    {front: "Strings",
    back: "Used for storing and manipulating text.",
    source: "https://www.w3schools.com/js/js_strings.asp",
    subject: "My List"},
    {front: "Array iteration methods ",
    back: "Methods operate on every array item.",
    source: "https://www.w3schools.com/js/js_array_iteration.asp",
    subject: "My List"}
]

# For each flashcard object in the flashcards variable
# we should try to create a new instance if they cannot be found in the database
# the bang operator tells the method to display the full error message on error
talentDriven = User.first

flashcards.each do |flashcard|
    talentDriven.flashcards.create_or_find_by!(flashcard)
end

p "Created #{Flashcard.count} Flashcards"
