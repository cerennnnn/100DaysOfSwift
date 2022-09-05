import UIKit

//COMPLEX DATA TYPES

//Arrays -> are collections of values that are stored as a single value.

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

//arrays positions start with 0, so if you want item 1 we would write :
beatles[1] // Paul McCartney

//Swift crashes if you read an item that doesn't exist.

//Sets -> are collections of values just like arrays, except they have 2 differences :
//1 - items aren't stored in any order (random order)
//2 - no item can appear twice in a set, all items MUST be unique.

let colors = Set(["red", "green", "blue"])
//because they're unordered, you can;t read values from a set using numerical positions.


//Tuples -> allow you to store several values together in a single value.
//1 - you can't add or remove items from a tuple, they are fixed in size.
//2 - you can't change the type of items in a tuple, they always have the same types they were created with.
//3 - you can access items in a tuple using numerical positions or by naming them, but Swiftwon't let you read numbers or names that don't exist.

var name = (first: "Taylor", last: "Swift")

//access items using numerical positions starting from 0:
name.0

//or access items using their names:
name.first

//! you can change the values inside a tuple after you created it but not the types of values so if you tried to change name to be (first: "Justin", age: 25) you would get an error.

//dictionaries -> are collections of values just like arrays but rather than storing things with an integer position you can access them using anything you want.

let height = [
    "Taylor Swift" : 1.78,
    "Ed Sheran" : 1.73
]

height["Taylor Swift"]

//use type annotations like this: [String: Double], [String, String]

//dictionary default values bc of optionals :
let favoriteIceCream = [
    "Paul" : "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Charlotte", default: "unknown"]

//arrays, sets and dictionaries are called collections because they collect values together in one place.

//creating empty collections
//empty dictionary
var teams = [String: String]()

//creating empty array
var results = [Int]()

//creating an empty set
var words = Set<String>()
var numbers = Set<Int>()

//This is because Swift has special syntax only for dictionaries and arrays; other types must use angle bracket syntax like sets.
//if you wanted, you could create arrays and dictionaries with similar syntax:
var score = Dictionary<String, Int>()
var result = Array<Int>()

//Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.
enum Result {
    case success
    case failure
}

let a = Result.failure

//enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

//enum raw values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 2)

