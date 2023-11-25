import UIKit

//Structs -> Let us create our own data types out of several small types.

//Creating Structs
//Variables called structs r called properties.
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

//Properties can have default values just like regular variables, and you can usually rely on Swift’s type inference.

//Computed Properties
//Sport struct has a name property that stores a String. These r called 'stored properties'.
//Computed property ->  A property that runs code to figure out its value.

struct Sport2 {
    var name: String
      var isOlympicSport: Bool

      var olympicStatus: String {
          if isOlympicSport {
              return "\(name) is an Olympic sport"
          } else {
              return "\(name) is not an Olympic sport"
          }
      }
}

//As you can see, olympicStatus looks like a regular String, but it returns different values depending on the other properties.
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//Computed properties MUST be a variable.

//example
struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)

//Property Observers -> Let you run code before or after any property changes.
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            //What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes:
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//You can also use willSet to take action before a property changes, but that is rarely used.

//Methods
//Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

//The only real difference is that methods belong to a type, such as structs, enums, and classes, whereas functions do not.

//Mutating methods

//If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.
//When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

//Because it changes the property, Swift will only allow that method to be called on Person instances that are variables:

var person = Person(name: "Ed")
person.makeAnonymous()

//Properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of arrays
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

//Initializers
//Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.
struct User {
    var username: String
}

var user = User(username: "twostraws")

//We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this:

struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

//You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

//Referring to the current instance
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used.
struct Student {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}

//Static properties and methods
//You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

