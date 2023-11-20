import UIKit

//Variables -> Create a new variable.
var favoriteShow = "Orange Is The New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

//Strings & Integers
var str = "Hello, playground"
var age = 38
var population = 8_000_000 //for ease of reading
var meaningOfLife = 42 //meaningOfLife is an Int bc 42 is assigned to it. -> type inference

//Multi-line strings
var str1 = """
This goes
over multiple
times
"""

//To avoid line breaks:
var str2 = """
This goes\
over multiple\
times
"""

//String interpolation -> Insert data inside strings.
var score = 85
var str3 = "Your score was \(score)"

//Constants -> Set once & never change it.
let taylor = "SWift"

//Use let over var as much as possible.

//Type annotations -> Swift assigns a type to a variable/constant based on the value that's assigned to.
//Explain the type by writing it after the :
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78

//Even tho it says it's initial value is a 10 it's a Double which means it is 10.0.
var number: Double = 10
print(number)

//Arrays -> Collection of the same type of values that're stored in a single value.
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1] //paul

//‼️ Swift crashes if you read an item that doesn’t exist.
//Swifts arrays are zero-based meaning values can be read in an array using their numberical position starting from 0.
//Type annotation array declaration: [Bool], [String], [Int]

//Sets -> they collect values just like arrays but with 2 differences:
//1- Items are NOT stored in any order. They're unordered.
//2 - All items must be unique.

//Because they are unordered, you can’t read values from a set using numerical positions like you can with arrays.

let colors = Set(["red", "green", "blue"])

//Add a new element to Arrays -> append, Set -> insert
//When we check a set contains a specific element we get a really fast answer compared to arrays which has to check all the values starting from the beginning.

//Type annotation definition syntax:
let stringSet: Set<String>

//Tuples -> Allow you to store several values together in a single value.
//They're fixed in size, u cannot add new elements to it.
//The type of a tuple cannot be changed.
//Can be accessed by using numerical positions or by naming them.
var name = (first: "Taylor", last: "Swift")
name.0
name.first

//The values inside of a tuple can be changed but not the types of values.

//Dictionaries -> Hold multiple values as key-value pairs.
//Dictionaries don't store the items using an index, they're not like arrays.
//Trying to access a key that does not exists will crash the code. Hence the return value of a dictionary is an optional.

//Type annotation definition of dictionary: [String: Double], [String: String]
let heights = [
    "Taylor": 1.78,
    "Ed": 1.73
]

//We can provide a default value in case the key might not exists.
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

print(favoriteIceCream["Charlotte", default: "Unknown"])

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

let historyResult = results["history", default: 0]

//Collection Types = Sets + Arrays + Dictionaries

//Creating empty collections
var teams: [String: String] = [:] //An empty dictionary of type String: String
var teams2 = [String: String]()

teams["Paul"] = "Red"

var results2 = [Int]() //An empty array of type Int

var words: Set<String> = Set<String>() //An empty Set of type String

var scores = Dictionary<String, Int>()
var result3 = Array<Int>()
//Except for arrays & dictionaries all other types must use angle brackets syntax.

//Enumerations(Enums) -> A way of defining groups of related values in a way that makes them easier to use.
enum Result {
    case success
    case failure
}

let result4 = Result.success
let result5: Result = .failure

//Enum associated values -> Let's you add additional information.
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.singing(volume: 5)

//Enums with associated values let us add extra information to an enum case – think of them as being adjectives to a noun, because it lets us describe the thing in more detail.

//Enum Raw Values -> Lets assign values to enum cases.
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
 
let earth = Planet(rawValue: 2) //Swift automatically assigns 0 from the beginning.

//If we want we can change the numbers like this:
enum Planet2: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

//So it starts counting from 1.

//Operations & Conditions
//Arithmetic Operators = +, -, *, /
let firstScore = 12
let secondscore = 4

let total = firstScore + secondscore
let difference = firstScore - secondscore
let product = firstScore * secondscore
let divided = firstScore / secondscore

// % -> modulo -> It calculates how many times one number can fit inside another, then sends back the value that’s left over.
let remainder = 13 % secondscore

//Operator Overloading -> An operator can be used for multiple purposes.
//i.e + can be used to add 2 numbers together:
let sum = 1 + 2
//And also join strings together:
let joinedString = "to" + "gether"
//Can also be used to join arrays together:
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles2 = firstHalf + secondHalf

//Compound assignment operators
var score2 = 4
score2 += 10 // score2 = score2 + 10

var quote = "I'll be there"
quote += " for you." //quote = quote + " for you"

//Comparison operators
firstScore < secondscore
firstScore >= secondscore
firstScore == secondscore
firstScore != secondscore

//Those operators also work with Strings bcus Strings have a natural alphabetical order:
"Taylor" <= "Swift"

//We can even ask Swift to make our enums comparable, like this:
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second) //That will print “true”, because small comes before large in the enum case list.

//Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//Swift is a case-sensitive language meaning that "Sum" and "sum" are different from each other.

//Combining Operators -> &&(AND) and ||(OR)
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

//Ternary Operator -> value = condition ? result : result

let firstCard2 = 11
let secondCard2 = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

//It's the same as above:
if firstCard2 == secondCard2 {
    print("Cards are the same")
} else {
    print("Cards are different")
}

//Switch -> An alternative for using too much if-else.
//'fallthrough' keyword is used to continue on to the next case.
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

//Range Operators -> ...(aka closed range operator), ..< or ..>(half-open range operator)
//1..<5 -> 1, 2, 3, 4
//1...5 -> 1, 2, 3, 4, 5

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0...]) //one-sided range operator -> give me 0 to the end of the array

//Loops
//For Loops
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "Reputation", "1989"]

for album in albums {
    print("\(album) is on Apple music.")
}

//_ can be used to omit the loop variable
print("Players gonna ")

for _ in 1...5 {
    print("play")
}


//While Loops
var number2 = 1

while number2 <= 5 {
    print(number2)
    number2 += 1
}

print("Ready or not, here I come!")

let colors2 = ["Red", "Green", "Blue", "Orange", "Yellow"]
var colorCounter = 0
while colorCounter < 5 {
    print("\(colors2[colorCounter]) is a popular color.")
    colorCounter += 1
}

//Repeat Looops
repeat {
    print(number)
    number += 1
} while number <= 5

print("Ready or not, here I come!")

//Because the condition comes at the end of the repeat loop the code inside the loop will always be executed at least once, whereas while loops check their condition before their first run.

//Exiting Loops -> break
var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
    
}

//With a regular break, only the inner loop would be exited – the outer loop would continue where it left off.

//Skipping Item -> skip the current item and continue on to the next one use 'continue'.
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

