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
    {email:"talentdrivendevelopment@gmail.com", provider:"seed", uid:1, password:"TalentDriven"},
    {email:"123@gmail.com", provider:"seed", uid:999995, password:"123456"},
    {email:"234@gmail.com", provider:"seed", uid:999996, password:"123456"},
    {email:"345@gmail.com", provider:"seed", uid:999997, password:"123456"},
    {email:"456@gmail.com", provider:"seed", uid:999998, password:"123456"},
    {email:"567@gmail.com", provider:"seed", uid:999999, password:"123456"}]

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
    {front: "Primitive Data Type",
    back: "Data that has a primitive value: string, number, boolean, null, undefined",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "console.log()",
    back: "Method to display data.",
    source: "https://www.w3schools.com/js/js_output.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Statements",
    back: "Are composed of: Values, Operators, Expressions, Keywords, and Comments.",
    source: "https://www.w3schools.com/js/js_statements.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "JavaScript (JS)",
    back: "A programming language of HTML and the Web.",
    source: "https://www.w3schools.com/js/default.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Syntax",
    back: "The set of rules, which defines two types of values: Fixed values (literals) and variable values (variables).",
    source: "https://www.w3schools.com/js/js_syntax.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Variables",
    back: "Containers for storing data values.",
    source: "https://www.w3schools.com/js/js_variables.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Assignment",
    back: "Operators assign values to the variables.",
    source: "https://www.w3schools.com/js/js_assignment.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Strings",
    back: "Used for storing and manipulating text.",
    source: "https://www.w3schools.com/js/js_strings.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Objects",
    back: "Containers for named values called properties or methods.",
    source: "https://www.w3schools.com/js/js_objects.asp",
    subject: "Javascript (Basics)",
    user_id: 1},
    {front: "Function",
        back: "A block of code designed to perform a particular task.",
        source: "https://www.w3schools.com/js/js_functions.asp",
        subject: "Javascript (Basics)",
user_id: 1},

# Javascript (Adv.)
    {front: "Boolean prototype Constructor",
    back: "A constructor that allows you to add new properties and methods to JavaScript booleans.",
    source: "https://www.w3schools.com/jsref/jsref_prototype_boolean.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Array constructor Property",
    back: "The constructor property returns the constructor function for an object.",
    source: "https://www.w3schools.com/jsref/jsref_constructor_array.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Array length Property",
    back: "Property sets or returns the number of elements in an array.",
    source: "https://www.w3schools.com/jsref/jsref_length_array.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Closure",
    back: "A function having access to the parent scope, even after the parent function has closed.",
    source: "https://www.w3schools.com/js/js_function_closures.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Class super Keyword",
    back: "super() refers to the parent class",
    source: "https://www.w3schools.com/jsref/jsref_class_super.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Class extends Keyword",
    back: "Used to create a child class of another class (parent).",
    source: "https://www.w3schools.com/jsref/jsref_class_extends.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "Class constructor Method",
    back: "constructor() method is a special method for creating and initializing objects created within a class.",
    source: "https://www.w3schools.com/jsref/jsref_constructor_class.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "JavaScript Object Notation (JSON)",
    back: "A format for storing and transporting. It is often used when data is sent from a server to a web page.",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "JSON Objects",
    back: "Objects written inside curly braces.",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},
    {front: "JSON Arrays",
    back: "arrays are written inside square brackets",
    source: "https://www.w3schools.com/js/js_json.asp",
    subject: "Javascript (Adv.)",
    user_id: 1},

# Javascript Methods Flashcard list
    {front: "map()",
    back: "Creates a new array with the result of calling a function for each array element.",
    source: "https://www.w3schools.com/jsref/jsref_map.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "filter()",
    back: "Creates a new array with every element in an array that pass a test.",
    subject: "Javascript Methods",
    source: "https://www.w3schools.com/jsref/jsref_filter.asp",
    user_id: 1},
    {front: "concat()",
    back: "Joins two or more arrays, and returns a copy of the joined arrays.",
    source: "https://www.w3schools.com/jsref/jsref_concat_array.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "includes()",
    back: "Check if an array contains the specified element.",
    source: "https://www.w3schools.com/jsref/jsref_includes_array.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "join()",
    back: "	Joins all elements of an array into a string.",
    source: "https://www.w3schools.com/jsref/jsref_join.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "pop()",
    back: "	Removes the last element of an array, and returns that element.",
    source: "https://www.w3schools.com/jsref/jsref_pop.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "push()",
    back: "Adds new elements to the end of an array, and returns the new length.",
    source: "https://www.w3schools.com/jsref/jsref_push.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "shift()",
    back: "Removes the first element of an array, and returns that element.",
    source: "https://www.w3schools.com/jsref/jsref_shift.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "slice()",
    back: "Selects a part of an array, and returns the new array.",
    source: "https://www.w3schools.com/jsref/jsref_slice_array.asp",
    subject: "Javascript Methods",
    user_id: 1},
    {front: "sort()",
    back: "Sorts the elements of an array.",
    source: "https://www.w3schools.com/jsref/jsref_sort.asp",
    subject: "Javascript Methods",
    user_id: 1},

# Ruby (Basics)
    {front: "def",
    back: "Keyword begins the header of the method",
    source: "https://www.learnrubyonline.org/en/Methods",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "puts/p",
    back: "Print something to the console so the user can see it",
    source: "https://www.learnrubyonline.org/en/Hello_World",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "=begin",
    back: "Newline added by Ruby when the users use the 'puts' keyword",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "=end",
    back: "How to end multi-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "#",
    back: "How to start a single-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "Hashes",
    back: "Just like arrays, hashes allow you to store multiple values together. However, while arrays store values with a numerical index, hashes store information using key-value pairs",
    source: "https://www.learnrubyonline.org/en/Variables_and_Types",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "While statements",
    back: "Repeat a block of code as long as a condition is true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "Until statements",
    back: "The opposite of while statements; they repeat until a condition becomes true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)",
    user_id: 1},
    {front: "Unless statement",
    back: "Structured similarly to an if statement, but it will only be done if the condition is false",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Ruby (Basics)",
    user_id: 1},

# Ruby (Adv.)
    {front: "Modules",
    back: "A way of grouping together methods, classes, and constants and it give you two major benefits: provide a namespace and prevent name clashes and implement the mixin facility",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Yield Statement",
    back: "Method can then invoke the block one or more times",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/intro.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Initialize",
    back: "Method in ruby programs that store the values as instance variables within the object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Inheritance",
    back: "Allows you to create a class that is a refinement or specialization of another class",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Attributes",
    back: "Defined the methods that let you access and manipulate the state of an object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Class Variables",
    back: "shared among all objects of a class, and it is also accessible to the class methods",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Public methods ",
    back: "Can be called by anyone---there is no access control. Methods are public by default (except for initialize, which is always private)",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Protected methods",
    back: "Can be invoked only by objects of the defining class and its subclasses. Access is kept within the family",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Private methods",
    back: "Object cannot be specified and called with an explicit receiver because it can be called only in the defining class and by direct descendents within that same object",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
    subject: "Ruby (Adv.)",
    user_id: 1},
    {front: "Blocks",
    back: "Used to define a chunk of code that must be run under some kind of transactional control",
    source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_containers.html",
    subject: "Ruby (Adv.)",
    user_id: 1},

# Ruby Methods Flashcard list
    {front: "pop method of an array",
    back: "Removes the last element from self and returns it, or nil if the array is empty.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-pop",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "concat method of an array",
    back: "Appends the elements of +other_ary+s to self.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-length",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "push method of an array",
    back: "Append — Pushes the given object(s) on to the end of this array. This expression returns the array itself, so several appends may be chained together.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-push",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "unshift methd of an array",
    back: "Prepends objects to the front of self, moving other elements upwards. See also #shift for the opposite effect.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-unshift",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "sort! method of an array",
    back: "Sorts self in place.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-sort-21",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "each_index method of an array",
    back: "Same as #each, but passes the index of the element instead of the element itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each_index",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "replace method of an array",
    back: "Replaces the contents of self with the contents of other_ary, truncating or expanding if necessary.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-replace",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "insert method of an array",
    back: "Inserts the given values before the element with the given index.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-insert",
    subject: "Ruby Methods",
    user_id: 1},
    {front: "each {|item|block} method of an array",
    back: "Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.",
    source: "https://ruby-doc.org/core-2.4.1/Array.html#method-i-each",
    subject: "Ruby Methods",
    user_id: 1},

# Rails (Basics) Flashcard List
    {front: "Ruby on Rails",
    back: "Ruby on Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "Model Layer",
    back: "Represents the domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic specific to your application. ",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "Controller Layer",
    back: "Responsible for handling incoming HTTP requests and providing a suitable response",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "View Layer",
    back: "Composed of “templates” that are responsible for providing appropriate representations of your application's resources",
    source: "https://api.rubyonrails.org/",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "Migration",
    back: "Manage the evolution of a schema used by several physical databases",
    source: "api.rubyonrails.org/classes/ActiveRecord/Migration.html",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "Parameters()/params()",
    back: "Returns both GET and POST parameters in a single hash",
    source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "path_parameters()",
    back: "Returns a hash with the parameters used to form the path of the request",
    source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "Router",
    back: "Recognizes URLs and dispatches them to a controller's action, or to a Rack application. It can also generate paths and URLs, avoiding the need to hardcode strings in your views.",
    source: "https://guides.rubyonrails.org/routing.html#the-purpose-of-the-rails-router.",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: "HTTP Verb",
    back: "(3GET, POST, PATCH, PUT and DELETE) Each method is a request to perform an operation on the resource. A resource route maps a number of related requests to actions in a single controller.",
    source: "https://guides.rubyonrails.org/routing.html#http-verb-constraints",
    subject: "Rails (Basics)",
    user_id: 1},
    {front: ":param",
    back: "Option overrides the default resource identifier :id (name of the dynamic segment used to generate the routes).",
    source: "https://guides.rubyonrails.org/routing.html#using-as-in-nested-resources",
    subject: "Rails (Basics)",
    user_id: 1},

# React (Basics) Flashcard List
    {front: "React",
    back: "A declarative, efficient, and flexible JavaScript library for building user interfaces",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)",
    user_id: 1},
    {front: "Components”",
    back: "Compose complex UIs from small and isolated pieces of code.We use components to tell React what we want to see on the screen. When our data changes, React will efficiently update and re-render our components. ",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)",
    user_id: 1},
    {front: "render() Method",
    back: "Returns a description of what you want to see on the screen. React takes the description and displays the result.",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)",
    user_id: 1},
    {front: "map() Method",
    back: "Commonly used for mapping data to other data",
    source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
    subject: "React (Basics)",
    user_id: 1},
    {front: "Constructor",
    back: "Initalize the state of the class",
    source: "https://reactjs.org/tutorial/tutorial.html#making-an-interactive-component",
    subject: "React (Basics)",
    user_id: 1},
    {front: "Properties/props ",
    back: "Parameters taken in and returns a hierarchy of views to display via the render method by the component of the class",
    source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
    subject: "React (Basics)",
    user_id: 1},
    {front: "React Element",
    back: "Are first-class JavaScript objects that can be passed around in the applications and the array is used to renders multiple items in React",
    source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
    subject: "React (Basics)",
    user_id: 1},
    {front: "Function Components",
    back: "A simpler way to write components that only contain a render method and don’t have their own state",
    source: "https://reactjs.org/tutorial/tutorial.html#function-components",
    subject: "React (Basics)",
    user_id: 1},
    {front: ".slice()",
    back: " Create a new copy of an array after every move, and treated it as immutable",
    source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
    subject: "React (Basics)",
    user_id: 1},
    {front: "Immutability",
    back: "Makes complex features much easier to implement by the ability to undo and redo certain actions is a common requirement in applications",
    source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
    subject: "React (Basics)",
    user_id: 1},

# My List Flashcard list
    {front: "Boolean",
    back: "A JavaScript Boolean represents one of two values: true or false.",
    source: "https://www.w3schools.com/js/js_booleans.asp",
    subject: "My List",
    user_id: 1},
    {front: "While Loop",
    back: "Loop that loops through a block of code as long as a specified condition is true.",
    source: "https://www.w3schools.com/js/js_loop_while.asp",
    subject: "My List",
    user_id: 1},
    {front: "Function",
    back: "A block of code designed to perform a particular task and is executed when something invokes it (calls it).",
    source: "https://www.w3schools.com/js/js_functions.asp",
    subject: "My List",
    user_id: 1},
    {front: "Event",
    back: "HTML events are things that happen to HTML elements.",
    source: "https://www.w3schools.com/js/js_events.asp",
    subject: "My List",
    user_id: 1},
    {front: "Conditional Statements (if/else/else if)",
    back: "They are used to perform different actions based on different conditions.",
    source: "https://www.w3schools.com/js/js_if_else.asp",
    subject: "My List",
    user_id: 1},
    {front: "For Loop",
    back: "Execute a block of code a number of times.",
    source: "https://www.w3schools.com/js/js_loop_for.asp",
    subject: "My List",
    user_id: 1},
    {front: "Primitive Value",
    back: "A value that has no properties or methods.",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "My List",
    user_id: 1},
    {front: "Primitive Data Type",
    back: "Data that has a primitive value: string, number, boolean, null, undefined",
    source: "https://www.w3schools.com/js/js_object_definition.asp",
    subject: "My List",
    user_id: 1},
    {front: "Strings",
    back: "Used for storing and manipulating text.",
    source: "https://www.w3schools.com/js/js_strings.asp",
    subject: "My List",
    user_id: 1},
    {front: "Array iteration methods ",
    back: "Methods operate on every array item.",
    source: "https://www.w3schools.com/js/js_array_iteration.asp",
    subject: "My List",
    user_id: 1}
]

# For each flashcard object in the flashcards variable
# we should try to create a new instance if they cannot be found in the database
# the bang operator tells the method to display the full error message on error
flashcards.each do |flashcard|
    Flashcard.create_or_find_by!(flashcard)
end

p "Created #{Flashcard.count} Flashcards"
