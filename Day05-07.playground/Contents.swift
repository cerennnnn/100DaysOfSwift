import UIKit

//Functions

//Functions are designed to let us re-use code easily.
func printHelp() {
    let message = """
Welcome to My App!

Run this app inside a directory of images and
My App will resize them all into thumbnails.
"""
    
    print(message)
}

printHelp()

//Running a function = calling a function

//Accepting Parameters
//Values send to functions = parameters
//Values send to function when calling functions = arguments
func square(number: Int) {
    print(number * number)
}

square(number: 8)

//Returning Values

func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)

//When our functions contains only 1 expression we can omit the return keyword.
//Expression = A code that can be resolved to a single value.

func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

//When we’re performing actions such as creating variables, starting a loop, or checking a condition, then we call that a statement.

//Parameter Labels
//Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function.
func sayHello(to name: String) { //to -> external, name -> internal
    print("Hello, \(name)")
}

sayHello(to: "Taylor")

//Ommiting Parameter Labels -> use _
func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("Taylor")

//Default values
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

//This function can be called in 2 ways:
greet("Taylor")
greet("Tayler", nicely: false)

//Variadic Functions -> Functions that accept any number of parameters of the same type.
print("Haters", "gonna", "hate")

//You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

//Throwing Functions -> function that might throw errors  is marked as throws.
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

//Error throwing functions need to be handled by using do-try-catch blocks.

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//Closures
//Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters. Functions used in this way are called closures.
let driving = {
    print("I'm driving in my car.")
}

//That effectively creates a function without a name, and assigns that function to driving. You can now call driving() as if it were a regular function, like this:

driving()

//Accepting parameters
let drivingTo = { (place: String) in
    print("I'm going to \(place) in my car.")
}

//You do NOT use parameter labels when calling closures.
drivingTo("London")

//The 'in' keyword marks the end of the parameter list and the start of the closure’s body itself.

//Closures cannot use external parameter labels.

//Returning Values From a Closure
let driving2 = { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

let message = driving2("London")
print(message)

//If you want to return a value without excepting any parameters:
let payment = { () -> Bool in
    print("Paying an anonymous person...")
    return true
}

//Closures as parameters
//Bcus closures can be used just like strings and integers, you can pass them into functions.
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

//example
let awesomeTalk = {
    print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)

//Trailing Closure -> If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

//travel function accepts an action closure so that it can be run between two print() calls:
travel {
    print("I'm driving in my car.")
}

//When using trailing closure syntax we should miss off the final parameter name.

//example
func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

//example
func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}
repeatAction(count: 5) {
    print("Hello, world!")
}

//example
func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}

//Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car.")
}

//example
func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

//Closures with Return Values
//() -> Void means accept no parameters and return nothing
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

//example
func playSong(_ name: String, notes: () -> String) {
    print("I'm going to play \(name).")
    let playedNotes = notes()
    print(playedNotes)
}

playSong("Marry Had a Little Lamb") {
    "EDCDEEEDDDEGG"
}

//example
func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result).")
    }
}

//bc compiler knows 'number' is an Int, we don't have to write it's type.
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}

//But we could've written it like this too:
manipulate(numbers: [1, 2, 3]) { (number: Int)in
    return number * number
}

//Closures with Multiple Parameters
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived.")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}

//example
func getTransport(destination: String, method: (String, Int) -> Bool) {
    let maxCost = 10
    let result = method(destination, maxCost)
    if result {
        print("OK, you can travel.")
    } else {
        print("Sorry, you need more money.")
    }
}

//Returning Closures
//In the same way that you can pass a closure to a function, you can get closures returned from a function too.
func travel() -> (String) -> Void {
    return { //function's return value (String) -> Void closure
        print("I'm going to \($0).")
    }
}

let result2 = travel()
result2("London")

//It’s technically allowable – although really not recommended! – to call the return value from travel() directly:

let result3 = travel()("London")

//example
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

//example
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

//Capturing Values
//example
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
