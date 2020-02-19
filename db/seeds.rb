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

    {subject: "Javascript (Basics)",front: "Comparison Operator", back: "Comparison operators will return a Boolean value and these include ==, ===", source: "https://www.w3schools.com/js/js_operators.asp"},

    {subject: "Javascript (Basics)", front: "Relational Operator", back: "Relational operators will return a Boolean value and these include >, <, >=, <=", source: "https://www.w3schools.com/js/js_operators.asp"},

    {subject: "Javascript (Basics)", front: "Logical Operator", back: "Logical operators can return any type of data but uses the principle of Boolean data type to determine the outcome and these include &&, ||, ! (not)", source: "https://www.w3schools.com/js/js_operators.asp"},

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

#JavaScript (Adv.)
    {front:"Jest", back: "A JavaScript testing framework", source:"https://jestjs.io", subject: "JavaScript (Adv.)"},

    {front:"Test Driven Development(TDD)", back: "An approach to software development where you write tests first, then use those tests to drive the design and development of your software application", source:"https://www.codecademy.com/articles/tdd-red-green-refactor", subject: "JavaScript (Adv.)"},

    {front:"Red-Green Refactor", back: "A framework that developers use to build a test suite (red), write implementation code (green), and optimize their codebase in short development cycles (refactor)", source:"https://www.codecademy.com/articles/tdd-red-green-refactor", subject: "JavaScript (Adv.)"},

    {front:"JSON", back: "JavaScript Object Notation that helps us store and exchange data by converting any JavaScript object into JSON, and sending JSON to the server", source:"https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript#Objects", subject: "JavaScript (Adv.)"},

    {front:"Object", back: "Objects are collections of any datatype or function with a key:value pair where we can access their properties using dot notation", source:"https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript#Objects", subject: "JavaScript (Adv.)"},

    {front:"API", back: "Application Programming Interface which allows a developer to access objects or actions they need from parts of their program or a third party", source:"https://www.freecodecamp.org/news/what-is-an-api-in-english-please-b880a3214a82/", subject: "JavaScript (Adv.)"},

    {front:"Object Destructuring", back: "Taking the properties of an object and breaking them out into individual, recallable variables", source:"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment", subject: "JavaScript (Adv.)"},

    {front:"Classes", back: "A particular type of function that contain data and behavior and have their own scope, they are always PascalCased", source:"https://www.w3schools.com/js/js_classes.asp", subject: "JavaScript (Adv.)"},

    {front:"constructor", back: "A special method for creating and initializing properties and can take arguments", source:"https://www.w3schools.com/js/js_classes.asp", subject: "JavaScript (Adv.)"},

    {front:"this", back: "A JavaScript keyword that refers to the object it belongs to", source:"https://www.w3schools.com/js/js_classes.asp", subject: "JavaScript (Adv.)"},

    {front:"new", back: "Used when creating a new instance of a class (an object)", source:"https://www.w3schools.com/js/js_classes.asp", subject: "JavaScript (Adv.)"},

    {front:"Closure", back: "A function having access to an outer function's scope from an inner function where the variables are protected by the scope of the outer function", source:"https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures", subject: "JavaScript (Adv.)"},

    {front:"Class Inheritance", back: "In most class-based object-oriented languages, it allows one object to acquire all the properties and behaviors of another object", source:"https://codeburst.io/javascript-inheritance-25fe61ab9f85", subject: "JavaScript (Adv.)"},

    {front:"Extends", back: "Used in the declaration of the class, extending the data and behavior of the parent class (or the class we are inheriting from)", source:"https://medium.com/beginners-guide-to-mobile-web-development/super-and-extends-in-javascript-es6-understanding-the-tough-parts-6120372d3420", subject: "JavaScript (Adv.)"},

    {front:"super", back: "Within the constructor method we call super() which passes the attributes from the constructor in the parent class", source:"https://medium.com/beginners-guide-to-mobile-web-development/super-and-extends-in-javascript-es6-understanding-the-tough-parts-6120372d3420", subject: "JavaScript (Adv.)"},

    {front:"Class vs. Object", back: "A class is a blueprint from which you can create the instance and has a logical existence while an object has a physical existence and is the instance of the class", source:"https://www.javatpoint.com/difference-between-object-and-class", subject: "JavaScript (Adv.)"},

    {front:"Block Scope", back: "A block scope is the area within {curly brackets} that limit the scope of variables defined with the let keyword", source:"https://www.w3schools.com/js/js_let.asp", subject: "JavaScript (Adv.)"},

    {front:"Object Oriented Programming", back: "A popular style of programming that creates individual objects from a common object using inheritance", source:"https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object-oriented_JS", subject: "JavaScript (Adv.)"},


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

#Git Flow
    {front:"git init", back: "Turn an existing directory into a git repository", source:"https://git-scm.com/docs/git-init", subject: "Git Flow"},

    {front:"git clone [url]", back: "Clone (download) a repository that already exists on
    GitHub, including all of the files, branches, and commits", source:"https://git-scm.com/docs/git-clone", subject: "Git Flow"},


    {front:"git config --global user.name name", back: "Sets the name you want attached to your commit transactions", source:"https://git-scm.com/docs/git-config", subject: "Git Flow"},


    {front:"git config --global user.email email_address", back: "Sets the email you want attached to your commit transactions", source:"https://git-scm.com/docs/git-config", subject: "Git Flow"},


    {front:"git branch [branch-name]", back: "Creates a new branch", source:"https://git-scm.com/docs/git-branch", subject: "Git Flow"},


    {front:"git branch", back: "Displays current branch", source:"https://git-scm.com/docs/git-branch", subject: "Git Flow"},


    {front:"git checkout [branch-name]", back: "Switches to the specified branch and updates the working directory", source:"https://git-scm.com/docs/git-checkout", subject: "Git Flow"},


    {front:"git add [file]", back: "Snapshots the file in preparation for versioning", source:"https://git-scm.com/docs/git-add", subject: "Git Flow"},


    {front:"git commit -m descriptive message", back: "Records file snapshots permanently in version history", source:"https://git-scm.com/docs/git-commit", subject: "Git Flow"},


    {front:"git branch -d [branch-name]", back: "Deletes the specified branch", source:"https://git-scm.com/docs/git-branch", subject: "Git Flow"},


    {front:"git pull", back: "Updates your current local working branch with all new commits from the corresponding remote branch on GitHub. git pull is a combination of git fetch and git merge", source:"https://git-scm.com/docs/git-pull", subject: "Git Flow"},


    {front:"git push", back: "Uploads all local branch commits to GitHub", source:"https://git-scm.com/docs/git-push", subject: "Git Flow"},


    {front:"The .gitgnore file", back: "Sometimes it may be a good idea to exclude files from being tracked with Git. This is typically done in a special file named .gitignore", source:"https://git-scm.com/docs/gitignore", subject: "Git Flow"},


    {front:"git", back: "Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals", source:"https://git-scm.com/docs/git", subject: "Git Flow"},


    {front:"GitHub", back: "a platform for hosting and collaborating on Git repositories", source:"https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf", subject: "Git Flow"},


    {front:"fork", back: "a copy of a repository on GitHub owned by a different user", source:"https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf", subject: "Git Flow"},


    {front:"pull request", back: "A place to compare and discuss the differences introduced on a branch with reviews, comments, integrated tests, and more", source:"https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf", subject: "Git Flow"},


    {front:"Version Control", back: "Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later", source:"https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control", subject: "Git Flow"},


    {front:"git add .", back: "Updates the index using the current content found in the working tree", source:"https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control", subject: "Git Flow"},

    {front:"git status", back: "Shows the working tree status", source:"https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control", subject: "Git Flow"},

#React (Basics)
    {front:"React", back: "A component based JavaScript library for building webpages, mobile web pages, and even native mobile applications that uses many small parts and joins them together to form entire applications", source:"https://reactjs.org/", subject: "React (Basics)"},

    {front:"Nested Component", back: "A component called inside the return of another component", source:"http://www.reactjstutorial.net/nested-components.html", subject: "React (Basics)"},

    {front:"Dumb Component", back: "Only responsible for presenting to the DOM so the focus is on UI, accepting props, rarely include state, and require no app dependencies", source:"https://alligator.io/react/smart-dumb-components/", subject: "React (Basics)"},

    {front:"Smart Component", back: "Responsible for how things work so they call lifecycle methods, API's, and libraries, manipulates data, and manages state", source:"https://alligator.io/react/smart-dumb-components/", subject: "React (Basics)"},

    {front:"Class Component", back: "A component that inherits attributes from React.Component", source:"https://www.w3schools.com/react/react_components.asp", subject: "React (Basics)"},

    {front:"Props", back: "Arguments passed into React components with HTML attributes", source:"https://www.w3schools.com/react/react_props.asp", subject: "React (Basics)"},

    {front:"State", back: "Stored values that represent instances and are maintained by the component using key value pairs", source:"https://www.w3schools.com/react/react_state.asp", subject: "React (Basics)"},

    {front:"setState()", back: "Method that allows user to define and manipulate state over time", source:"https://www.w3schools.com/react/react_state.asp", subject: "React (Basics)"},

    {front:"JSX", back: "An HTML like syntax used in React that can co-exist with JavaScript/React code", source:"https://www.reactenlightenment.com/react-jsx/5.1.html", subject: "React (Basics)"},

    {front:"constructor", back: "A special method for creating and initializing properties and can take arguments", source:"https://www.w3schools.com/react/react_lifecycle.asp", subject: "React (Basics)"},

    {front:"super", back: "Within the constructor method we call super() which passes the attributes from the constructor in the parent class", source:"https://www.w3schools.com/react/react_props.asp", subject: "React (Basics)"},

    {front:"render()", back: "A required method that outputs HTML to the Document Object Model(DOM)", source:"https://www.w3schools.com/react/react_lifecycle.asp", subject: "React (Basics)"},

    {front:"this", back: "A React component keyword that refers to the object it belongs to", source:"https://www.w3schools.com/react/react_events.asp", subject: "React (Basics)"},

    {front:"onClick", back: "Allows React to perform actions based on user events", source:"https://www.w3schools.com/react/react_events.asp", subject: "React (Basics)"},

    {front:"DOM", back: "Document Object Model (DOM) is a programming interface for HTML and XML documents and it represents the page so that programming languages can connect to it", source:"https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction", subject: "React (Basics)"},

    {front:"Props vs. state", back: "Props are variables passed to it by its parent component while state is variables initialized and managed directly by the component", source:"https://flaviocopes.com/react-state-vs-props/", subject: "React (Basics)"},

    {front:"React Component Lifecycle", back: "Has 3 phases which include mounting: a component is put into the DOM like the constructor() or ComponentDidMount() method; updating: something in the component is updated like setState() or onClick(); unmounting: when a component is removed from the DOM like componentDidUnmount()", source:"https://reactjs.org/docs/react-component.html", subject: "React (Basics)"},

#Ruby
    {front:"Number (Integers)", back: "Holds value of an integer so there are no decimals", source:"https://ruby-doc.org/core-2.5.0/Integer.html", subject: "Ruby"},

    {front:"Number (Float)", back: "Represent inexact real numbers so if you want to return a non-whole number, you must pass a float", source:"https://ruby-doc.org/core-2.6/Float.html", subject: "Ruby"},

    {front:"Nil", back: "The datatype that is equal to nothing else", source:"https://www.rubyguides.com/2018/01/ruby-nil/", subject: "Ruby"},

    {front:"Symbol", back: "The unique key in a key:value pair", source:"http://rubylearning.com/satishtalim/ruby_symbols.html", subject: "Ruby"},

    {front:"String interpolation", back: "Replacing variables within a string with the values they represent", source:"http://ruby-for-beginners.rubymonstas.org/bonus/string_interpolation.html", subject: "Ruby"},

    {front:"irb", back: "Prints something on the screen starting a new line", source:"https://github.com/ruby/irb", subject: "Ruby"},

    {front:"puts", back: "Interactive Ruby Shell. In macs, allows coding in terminal", source:"https://www.rubyguides.com/2018/10/puts-vs-print/", subject: "Ruby"},

    {front:"print", back: "Prints something on the screen without starting a new line", source:"https://www.rubyguides.com/2018/10/puts-vs-print/", subject: "Ruby"},

    {front:"p", back: "Displays a raw version of an object", source:"https://www.rubyguides.com/2018/10/puts-vs-print/", subject: "Ruby"},

    {front:"pp", back: "A pretty-printer for ruby objects", source:"https://ruby-doc.org/stdlib-2.4.1/libdoc/pp/rdoc/PP.html", subject: "Ruby"},

    {front:"Inheritance", back: "Relationship between two classes", source:"http://rubylearning.com/satishtalim/ruby_inheritance.html", subject: "Ruby"},

    {front:"Object", back: "Objects are collections of any datatype or function with a key:value pair where we can access their properties by using brackets and the symbol key or by defining getter methods", source:"https://robdodson.me/ruby-objects-and-dot-syntax/", subject: "Ruby"},

    {front:"Accessor methods", back: "Allows developers to use dot notation to access properties of an object by defining getter methods inside the Class which return the instance variables of those properties", source:"https://robdodson.me/ruby-objects-and-dot-syntax/", subject: "Ruby"},

    {front:"Ruby variables", back: "Do not require a declaration such as var or let and are created with a single equal sign using snake_case", source:"https://www.tutorialspoint.com/ruby/ruby_variables.htm", subject: "Ruby"},

    {front:"Arrays", back: "Arrays can hold objects of any data type and each element can be reference by an index", source:"https://ruby-doc.org/core-2.4.1/Array.html", subject: "Ruby"},

    {front:"gets.chomp", back: "Prompts an input value from the user and must be stored as a variable with a command called chomp that removes any additional line breaks and white space from the end of a string", source:"https://www.rubyguides.com/2019/10/ruby-chomp-gets/", subject: "Ruby"},

    {front:"Ruby methods", back: "Create functionality that can be called as many times as needed using the keywords def and end", source:"https://www.tutorialspoint.com/ruby/ruby_methods.htm", subject: "Ruby"},

    {front:"Ruby Loop", back: "Allows you to iterate over items using do/end keywords to create a block ", source:"https://www.tutorialspoint.com/ruby/ruby_loops.htm", subject: "Ruby"},

    {front:"Instance Variable", back: "Variable starting with @ and belongs to an instance of a class (an object)", source:"https://www.rubyguides.com/2019/07/ruby-instance-variables/", subject: "Ruby"},

    {front:"Initialization", back: "Executed immediately when an instance of a class is created using the initialize keyword and takes any arguments", source:"https://www.rubyguides.com/2019/07/ruby-instance-variables/", subject: "Ruby"},

    {front:"Superclass", back: "The class from which another class would inherit methods", source:"http://rubylearning.com/satishtalim/ruby_inheritance.html", subject: "Ruby"},

    {front:"Class", back: "Structure and behavior of a set of objects, may only inherit from a single other class", source:"http://rubylearning.com/satishtalim/ruby_inheritance.html", subject: "Ruby"},

    {front:"RSpec", back: "A Ruby testing library for testing behavior", source:"https://blog.teamtreehouse.com/an-introduction-to-rspec", subject: "Ruby"},

#Ruby (Methods)
    {front:"length", back: "Returns the number of elements", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-length", subject: "Ruby (Methods)"},

    {front:"first", back: "Returns the first element", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-first", subject: "Ruby (Methods)"},

    {front:"last", back: "Returns the last element", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-last", subject: "Ruby (Methods)"},

    {front:"reverse", back: "Returns a new array containing the same elements in reverse order", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-reverse", subject: "Ruby (Methods)"},

    {front:"def", back: "Defines a method and gives it a name", source:"http://ruby-for-beginners.rubymonstas.org/writing_methods/definition.html", subject: "Ruby (Methods)"},

    {front:"hashes", back: "A collection of unique keys and their values referenced by their key and is constructed with either the key as a symbol with a hash rocket {:key => value} or the key value pair notation {key: value}", source:"https://www.tutorialspoint.com/ruby/ruby_hashes.htm", subject: "Ruby (Methods)"},

    {front:"include?", back: "Returns true if the given object is present", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-include-3F", subject: "Ruby (Methods)"},

    {front:"upcase", back: "Returns true if the given object is present", source:"https://ruby-doc.org/core-2.2.0/String.html#method-i-upcase", subject: "Ruby (Methods)"},

    {front:"capitalize", back: "Returns a copy of a string with the first character converted to uppercase", source:"https://ruby-doc.org/core-2.2.0/String.html#method-i-capitalize", subject: "Ruby (Methods)"},

    {front:"downcase", back: "Returns copy of a string with all letters lowercase", source:"https://ruby-doc.org/core-2.2.0/String.html#method-i-downcase", subject: "Ruby (Methods)"},

    {front:"Float", back: "Converts the argument to the float value", source:"https://ruby-doc.org/docs/ruby-doc-bundle/Manual/man-1.4/function.html#Float", subject: "Ruby (Methods)"},

    {front:"times", back: "Iterates the given block [integer] times, passing in values from zero to [integer]", source:"https://ruby-doc.org/core-2.2.0/Integer.html#method-i-times", subject: "Ruby (Methods)"},

    {front:"each", back: "Calls the given block once for each element in self, passing that element as a parameter", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-each", subject: "Ruby (Methods)"},

    {front:"map", back: "Iterates through an array and returns an array of the same length", source:"https://ruby-doc.org/core-2.2.0/Array.html#method-i-map", subject: "Ruby (Methods)"},

    {front:"replace", back: "Replaces the contents of the environment variables with the contents of hash", source:"https://ruby-doc.org/core-2.2.0/ENV.html#method-c-replace", subject: "Ruby (Methods)"},

#Rails
    {front:"SQL", back: "Structured Query Language designed for managing data held in a relational database management system", source:"https://www.w3schools.com/sql/", subject: "Rails"},

    {front:"PostgresSQL", back: "Open source object-relational database management system", source:"https://www.postgresqltutorial.com/", subject: "Rails"},

    {front:"Model", back: "Handles data and logic", source:"https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/", subject: "Rails"},

    {front:"Instance", back: "A single row entry in a database", source:"https://www.rubyguides.com/2019/07/ruby-instance-variables/", subject: "Rails"},

    {front:"Schema", back: "A description of the names and types of fields in a table", source:"https://edgeguides.rubyonrails.org/active_record_migrations.html", subject: "Rails"},

    {front:"Attributes", back: "The keys in a key/value pair (ex. column headers in a table)", source:"https://api.rubyonrails.org/classes/ActiveRecord/Attributes/ClassMethods.html", subject: "Rails"},

    {front:"Relation or Table", back: "A collection of instances that contain the same attributes", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"Primary Key ", back: "The identifier guaranteed to be unique for each instance that's automatically generated in rails and is named id", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"Active Record Migrations", back: "Files that run SQL commands for us and is how Rails is able to maintain consistency between the database run locally during development and the one run during production", source:"https://api.rubyonrails.org/v5.2.0/classes/ActiveRecord/Migration.html", subject: "Rails"},

    {front:"Foreign Key", back: "Used to associate one table to another", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"has_many", back: "Association creates a one-to-many relationship with another model", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"belongs_to", back: "Association sets up a one-to-one connection with another model, such that each instance of the declaring model belongs to one instance of the other model and always has the foreign key", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"has_many :through", back: "Association is often used to set up a many-to-many connection with another model, where the declaring model can have instances of another model through a third model", source:"https://guides.rubyonrails.org/association_basics.html", subject: "Rails"},

    {front:"Route", back: "Lives in the config/routes.rb and is the particular path and HTTP verb the Rails server needs to respond to a request", source:"https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/", subject: "Rails"},

    {front:"Controller", back: "Handles the user interface and application", source:"https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/", subject: "Rails"},

    {front:"View", back: "Handles the gui (graphical user interface) objects and presentation", source:"https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/", subject: "Rails"},

    {front:"MVC", back: "Model View Controller make up the components that create an application", source:"https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/", subject: "Rails"},

    {front:"Params", back: "Parameters help us pass values to the controller which we can then use to modify the view, params store info in the url", source:"https://www.rubyguides.com/2019/06/rails-params/", subject: "Rails"},

    {front:"RESTful", back: "Representational State Transfer which is a pattern to follow when structuring routes between the server and the client", source:"https://www.codecademy.com/articles/what-is-crud", subject: "Rails"},

    {front:"Strong Params", back: "Strong parameters or whitelisting is a way for us to manage exactly what goes into creating new object instances, and helps us keep unwanted information -- usually from malicious hackers -- out of the database", source:"https://www.rubyguides.com/2019/06/rails-params/", subject: "Rails"},

    {front:"Active Record Validations", back: "Data validations can be used in the model class to insure incomplete, invalid, or incorrect data from being saved in the database", source:"https://guides.rubyonrails.org/active_record_validations.html", subject: "Rails"},

    {front:"CRUD", back: "Create Read Update Delete make up the basic types of functionality a model should have when building an API", source:"https://www.codecademy.com/articles/what-is-crud", subject: "Rails"},

    {front:"Match HTTP verbs to CRUD", back: "Create: POST, Read: GET, Update: PUT/PATCH, Delete: DELETE are the commonly used HTTP methods for creating applications", source:"https://www.codecademy.com/articles/what-is-crud", subject: "Rails"},

    {front:"Fetch", back: "Fetching data from the server and resolves a promise when the data is returned", source:"https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch", subject: "Rails"},

    {front:"Promise", back: "An object that represents the return value or the thrown exception", source:"https://medium.com/@gauravbasti2006/lets-keep-our-promise-in-ruby-e45925182fdc", subject: "Rails"},

    {front:"Sessions vs. Cookies", back: "Both are used to store information but cookies are only stored on the client-side machine while sessions are stored both on the client as well as the server-side", source:"https://www.tutorialspoint.com/What-is-the-difference-between-session-and-cookies", subject: "Rails"},

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
