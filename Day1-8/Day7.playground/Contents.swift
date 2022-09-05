import UIKit
import Foundation

//closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived.")
}

travel { (place: String) in
    print("I'm going to \(place) in my car.")
}

//example #1

func buildCar(name: String, speed: (Int) -> Void) {
    print("Build the car.")
    speed(5)
}
buildCar (name: "Porshe") { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

//example #2
func login(then action: (String) -> Void) {
    print("Authentication...")
    let username = "twostraws"
    action(username)
}

login { (username: String) in
    print("Welcome, \(username)")
}

//example #3
func fetchData(then parse: (String) -> Void) {
    let data = "Success!"
    parse(data)
}

fetchData {(data: String) in
    print("Data received: \(data)")
}

//example #4
func makePizza(addTopings: (Int) -> Void) {
    print("The dough is  ready.")
    print("The base is flat.")
    addTopings(3)
}

makePizza { (toppingCount: Int) in
    let toppings = ["ham", "salami", "onions", "peppers"]
    for i in 0..<toppingCount {
        let topping = toppings[i]
        print("I'm adding \(topping)")
    }
}

//example #5
func fix(item: String, paybill: (Int) -> Void) {
    print("I've fixed your \(item)")
    paybill(450)
}

fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for what? Outrageous!")
}

//example #6
func study(reviseNotes: (String) -> Void) {
    let notes = "Napoleon was a short, dead dude."
    for _ in 1...10 {
        reviseNotes(notes)
    }
}
study { (notes: String) in
    print("I'm reading my notes: \(notes)")
}

//example #7
func runKidsParty(activities: ([String]) -> Void) {
    let kids = ["Bella", "India", "Phoebe"]
    activities(kids)
}
runKidsParty { (names: [String]) in
    for name in names {
        print("Here's your party bag, \(name).")
    }
}

//using closures as parameters when they return values
//example #1

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived")
}

travel { (place: String) in
    return "I'm going to \(place) in my car."
}

//example #2
func playSong(_ name: String, notes: () -> String) {
    print("I'm going to play \(name).")
    let playedNotes = notes()
    print(playedNotes)
}
playSong("Mary Had a Little Lamb") {
    return "EDCDEEEDDDEGG"
}

//example #3
func activateAI(_ ai: () -> String) {
    print("Let's see what this thing can do...")
    let result = ai()
    print(result)
}
activateAI {
    return "Come with me if you want to live."
}

//example #4
func loadData(input: () -> String) {
    print("Loading...")
    let str = input()
    print("Loaded: \(str)")
}
loadData {
    return "He thrusts his fists against the posts"
}

//example #5
func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}


//example #6
func encrypt(password: String, using algorithm: (String) -> String) {
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is \(result)")
}
encrypt(password: "t4ylor") { (password: String) in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}

//example #7
func increaseBankBalance(start: Double, interestCalculator: () -> Double) {
    print("Your current balance is \(start).")
    let interestRate = interestCalculator()
    let withInterest = start * interestRate
    print("You now have \(withInterest).")
}
increaseBankBalance(start: 200.0) {
    return 1.01
}

//example #8
func bakeCookies(number: Int, secretIngredient: () -> String) {
    for _ in 0..<number {
        print("Adding butter...")
        print("Adding flour...")
        print("Adding sugar...")
        print("Adding egg...")
        let extra = secretIngredient()
        print(extra)
    }
}
bakeCookies(number: 5) {
    return "Adding vanilla extract"
}

//returning closures from functions
//exsmple #1
func createValidator() -> (String) -> Bool {
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}
let validator = createValidator()
print(validator("twostraws"))

//example #2
func makeRecorder(media: String) -> () -> String {
    switch media {
    case "podcast":
        return {
            return "I'm recording a podcast"
        }
    default:
        return {
            return "I'm recording a video"
        }
    }
}
let recorder = makeRecorder(media: "podcast")
print(recorder())

//example #3
func createTravelMethod(distance: Int) -> (String) -> Void {
    if distance < 5 {
        return {
            print("I'm walking to \($0).")
        }
    } else if distance < 20 {
        return {
            print("I'm cycling to \($0).")
        }
    } else {
        return {
            print("I'm driving to \($0).")
        }
    }
}
let travelMethod = createTravelMethod(distance: 15)
travelMethod("London")

//eample #4
func makeSharer(destination: String) -> () -> String {
    switch destination {
    case "Twitter":
        return {
            return "I'm writing a tweet"
        }
    default:
        return {
            return "I'm sending an email"
        }
    }
}
let sharer = makeSharer(destination: "Twitter")
print(sharer())

//example #5
func createAgeCheck(strict: Bool) -> (Int) -> Bool {
    if strict {
        return {
            if $0 <= 21 {
                return true
            } else {
                return false
            }
        }
    } else {
        return {
            if $0 <= 18 {
                return true
            } else {
                return false
            }
        }
    }
}
let ageCheck = createAgeCheck(strict: true)
let result = ageCheck(20)
print(result)

//example #6
func makeGreeting(language: String) -> (String) -> Void {
    if language == "French" {
        return {
            print("Bonjour, \($0)!")
        }
    } else {
        return {
            print("Hello, \($0)!")
        }
    }
}
let greeting = makeGreeting(language: "English")
greeting("Paul")

//example #7
func createDoubler() -> (Int) -> Int {
    return {
        return $0 * 2
    }
}
let doubler = createDoubler()
print(doubler(2))

func travell(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived")
}

//shorthand parameter names

//travell { (place: String) -> String in
//    return "I'm going to\(place) in my car."
//}

travell {
    "I'm going to \($0) in my car."
}

//closures with multiple parameters

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//let result = travel()
//result("London")

//let result2 = travel()("London")


func Travel() -> (String) -> Void {
    var counter = 1
    
    return {
        print("I'm going to \($0)")
        counter += 1
    }
}
let Result = Travel()
Result("London")
Result("London")
Result("London")


//Capturing values
//example - 1
func makeAdder() -> (Int) -> Void {
    var sum = 0
    return {
        sum += $0
        print("Sum is now \(sum)")
    }
}
let adder = makeAdder()
adder(5)
adder(3)

//example - 2
func swingBat() -> () -> Void {
    var strikes = 0
    return {
        strikes += 1
        if strikes >= 3 {
            print("You're out!")
        } else {
            print("Strike \(strikes)")
        }
    }
}
let swing = swingBat()
swing()
swing()
swing()

//example - 2
func storeTwoValues(value1: String, value2: String) -> (String) -> String {
    var previous = value1
    var current = value2
    return { new in
        let removed = previous
        previous = current
        current = new
        return "Removed \(removed)"
    }
}
let store = storeTwoValues(value1: "Hello", value2: "World")
let removed = store("Value Three")
print(removed)

//example - 3
func createAgeValidator(strict: Bool) -> (Int) -> Bool {
    return {
        if strict {
            if $0 >= 21 {
                return true
            }
        } else {
            if $0 >= 18 {
                return true
            }
        }
        return false
    }
}
let Validator = createAgeValidator(strict: true)
Validator(21)

//example - 4
func findTallest() -> (String, Double) -> (String) {
    var tallestName = ""
    var tallestHeight = 0.0
    return {
        if $1 > tallestHeight {
            tallestName = $0
            tallestHeight = $1
        }
        return tallestName
    }
}

let tallest = findTallest()
var tallestName = tallest("Hannah", 1.72)
tallestName = tallest("Christina", 1.68)

//example - 5
func visitPlaces() -> (String) -> Void {
    var places = [String: Int]()
    return {
        places[$0, default: 0] += 1
        let timesVisited = places[$0, default: 0]
        print("Number of times I've visited \($0): \(timesVisited).")
    }
}
let visit = visitPlaces()
visit("London")
visit("New York")
visit("London")

//example - 6
func summonGenie(wishCount: Int) -> (String) -> Void {
    var currentWishes = wishCount
    return {
        if currentWishes > 0 {
            currentWishes -= 1
            print("You wished for \($0).")
            print("Wishes left: \(currentWishes)")
        } else {
            print("You're out of wishes.")
        }
    }
}
let genie = summonGenie(wishCount: 3)
genie("a Ferrari")
