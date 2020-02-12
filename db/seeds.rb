
Flashcard.first_or_create([
# Basic Ruby
    {front: "def",
    back: "Keyword begins the header of the method",
    source: "https://www.learnrubyonline.org/en/Methods",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "puts/p ",
    back: "Print something to the console so the user can see it",
    source: "https://www.learnrubyonline.org/en/Hello_World",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "=begin",
    back: "Newline added by Ruby when the users use the 'puts' keyword",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "=end",
    back: "How to end multi-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "#",
    back: "How to start a single-line comments",
    source: "https://www.learnrubyonline.org/en/Comments",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "Hashes",
    back: "Just like arrays, hashes allow you to store multiple values together. However, while arrays store values with a numerical index, hashes store information using key-value pairs",
    source: "https://www.learnrubyonline.org/en/Variables_and_Types",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "While statements",
    back: "Repeat a block of code as long as a condition is true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "Until statements",
    back: "The opposite of while statements; they repeat until a condition becomes true",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Basic Ruby",
    user_id: "1"}
    {front: "Unless statement",
    back: "Structured similarly to an if statement, but it will only be done if the condition is false",
    source: "https://www.learnrubyonline.org/en/Unless%2C_Until%2C_and_While",
    subject: "Basic Ruby",
    user_id: "1"}



# Advanced Ruby
{front: "Modules",
back: "A way of grouping together methods, classes, and constants and it give you two major benefits: provide a namespace and prevent name clashes and implement the mixin facility",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Yield Statement",
back: "Method can then invoke the block one or more times",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/intro.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Initialize",
back: "Method in ruby programs that store the values as instance variables within the object",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Inheritance",
back: "Allows you to create a class that is a refinement or specialization of another class",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Attributes",
back: "Defined the methods that let you access and manipulate the state of an object",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Class Variables",
back: "shared among all objects of a class, and it is also accessible to the class methods",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Public methods ",
back: "Can be called by anyone---there is no access control. Methods are public by default (except for initialize, which is always private)",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Protected methods",
back: "Can be invoked only by objects of the defining class and its subclasses. Access is kept within the family",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Private methods",
back: "Object cannot be specified and called with an explicit receiver because it can be called only in the defining class and by direct descendents within that same object",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html",
subject: "Advanced Ruby",
user_id: "1"}
{front: "Blocks",
back: "Used to define a chunk of code that must be run under some kind of transactional control",
source: "https://ruby-doc.com/docs/ProgrammingRuby/html/tut_containers.html",
subject: "Advanced Ruby",
user_id: "1"}


{front: "Rails",
back: "Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern",
source: "https://api.rubyonrails.org/",
subject: "Rails",
user_id: "1"}
{front: "Model Layer",
back: "Represents the domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic specific to your application. ",
source: "https://api.rubyonrails.org/",
subject: "Rails",
user_id: "1"}
{front: "Controller Layer",
back: "Responsible for handling incoming HTTP requests and providing a suitable response",
source: "https://api.rubyonrails.org/",
subject: "Rails",
user_id: "1"}
{front: "View Layer",
back: "Composed of “templates” that are responsible for providing appropriate representations of your application's resources",
source: "https://api.rubyonrails.org/",
subject: "Rails",
user_id: "1"}
{front: "Migration",
back: "Manage the evolution of a schema used by several physical databases",
source: "api.rubyonrails.org/classes/ActiveRecord/Migration.html",
subject: "Rails",
user_id: "1"}
{front: "Parameters()/params()",
back: "Returns both GET and POST parameters in a single hash",
source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
subject: "Rails",
user_id: "1"}
{front: "path_parameters()",
back: "Returns a hash with the parameters used to form the path of the request",
source: "https://api.rubyonrails.org/classes/ActionDispatch/Http/Parameters.html#method-i-params",
subject: "Rails",
user_id: "1"}
{front: "Router",
back: "Recognizes URLs and dispatches them to a controller's action, or to a Rack application. It can also generate paths and URLs, avoiding the need to hardcode strings in your views.",
source: "https://guides.rubyonrails.org/routing.html#the-purpose-of-the-rails-router.",
subject: "Rails",
user_id: "1"}
{front: "HTTP Verb",
back: "(3GET, POST, PATCH, PUT and DELETE) Each method is a request to perform an operation on the resource. A resource route maps a number of related requests to actions in a single controller.",
source: "https://guides.rubyonrails.org/routing.html#http-verb-constraints",
subject: "Rails",
user_id: "1"}
{front: ":param",
back: "Option overrides the default resource identifier :id (name of the dynamic segment used to generate the routes).",
source: "https://guides.rubyonrails.org/routing.html#using-as-in-nested-resources",
subject: "Rails",
user_id: "1"}

{front: "React",
back: "A declarative, efficient, and flexible JavaScript library for building user interfaces",
source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
subject: "React",
user_id: "1"}
{front: "Components”",
back: "Compose complex UIs from small and isolated pieces of code.We use components to tell React what we want to see on the screen. When our data changes, React will efficiently update and re-render our components. ",
source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
subject: "React",
user_id: "1"}
{front: "render() Method",
back: "Returns a description of what you want to see on the screen. React takes the description and displays the result.",
source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
subject: "React",
user_id: "1"}
{front: "map() Method",
back: "Commonly used for mapping data to other data",
source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
subject: "React",
user_id: "1"}
{front: "Constructor",
back: "Initalize the state of the class",
source: "https://reactjs.org/tutorial/tutorial.html#making-an-interactive-component",
subject: "React",
user_id: "1"}
{front: "Properties/props ",
back: "Parameters taken in and returns a hierarchy of views to display via the render method by the component of the class",
source: "https://reactjs.org/tutorial/tutorial.html#what-is-react",
subject: "React",
user_id: "1"}
{front: "React Element",
back: "Are first-class JavaScript objects that can be passed around in the applications and the array is used to renders multiple items in React",
source: "https://reactjs.org/tutorial/tutorial.html#showing-the-past-moves",
subject: "React",
user_id: "1"}
{front: "Function Components",
back: "A simpler way to write components that only contain a render method and don’t have their own state",
source: "https://reactjs.org/tutorial/tutorial.html#function-components",
subject: "React",
user_id: "1"}
{front: ".slice()",
back: " Create a new copy of an array after every move, and treated it as immutable",
source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
subject: "React",
user_id: "1"}
{front: "Immutability",
back: "Makes complex features much easier to implement by the ability to undo and redo certain actions is a common requirement in applications",
source: "https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important",
subject: "React",
user_id: "1"}
