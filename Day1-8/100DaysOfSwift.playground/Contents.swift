import UIKit
import Foundation

for _ in 1...10 {
    let randomNumber = Int(arc4random_uniform(10))
    print(randomNumber)
}

let c = ceil(6.4)
let f = floor(6.5)
let s = sqrt(4.0)
let p = pow(2.0, 3.0)
let a = abs(-10)
let mx = max(3, 5)
let mn = min(3, 5)

let date = Date()
let calender = Calendar.current
let year = calender.component(.year, from: date)
let month = calender.component(.month, from: date)
let day = calender.component(.day, from: date)
let mins = calender.component(.minute, from: date)
let secs = calender.component(.second, from: date)

let meters = Measurement.init(value: 50 , unit: UnitLength.meters)

//let driving = {
//    print("I'm driving in my car.")
//}
//
//driving()

//CLOSURE EXAMPLES

//let driving = { (place: String) in
//    print("i'm going to \(place) in my car.")
//}
//
//driving("London")

//func example
func pay(user: String, amount: Int) {
    //    code
}

//the same example but it's written with using closure
let payment = { (user: String, amount: Int ) in
    //    code
}

var cleanRoom = { (name: String) in
    print("i'm cleaning the \(name).")
}
cleanRoom("kitchen")

var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    } else {
        print("Your message was empty.")
    }
}

sendMessage("")

var click = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked.")
    } else {
        print("That button doesn't exist.")
    }
}
click(5)

var shareWinnings = { (amount: Double) in
    let half = amount / 2.0
    print("it's \(half) for me and \(half) for you.")
}

shareWinnings(2)

let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1km.")
    }
}
rowBoat(5)

let driving = {
    print("I'm driving in my car.")
}

//CLOSURES AS PARAMETERS

//action label'i, hem parametre almayan hem de hicbir sey dondurmeyen bir closure'u parametre olarak aliyor.
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

//Closures as parameters examples
var swift = {
    print("Cool - i can use closures!")
}
func writeCode(using language: () -> Void) {
    language()
    print("That'll be evleventy billion dollars, please.")
}

writeCode(using: swift)

//example 2
var makeFromStraw = {
    print("Let's build it out of straw.")
}
func buildHouse(using buildingStyle: () -> Void) {
    buildingStyle()
    print("It's already - can anyone blow it down?")
}

buildHouse(using: makeFromStraw)

//example 3
let awesomeTalk = {
    print("Here's a great talk!")
}

func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}

deliverTalk(name: "My Awesome Talk", type: awesomeTalk)

//example 4
let helicopterTravel = {
    print("Get to the chopper!")
}

func travel(by travelMeans: () -> Void) {
    print("Let's go on a vacation...")
    travelMeans()
}

travel(by: helicopterTravel)

//example 5
var payCash = {
    print("Here's the money.")
}

func buyClothes(item: String, using payment: () -> Void) {
    print("I'll take this \(item).")
    payment()
}

buyClothes(item: "jacket", using: payCash)

//example 6
let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}
func printDocument(contents: (String) -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents("Ceren")
}

printDocument(contents: resignation)

//example 7
let driveSafely = {
    print("I'm being a considerate driver.")
}
func drive(using driving: () -> Void) {
    print("Let's get in the car.")
    driving()
    print("We're there!")
}
drive(using: driveSafely)

//TRAILING CLOSURE SYNTAX

//example 1
func travell(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travell() {
    print("I'm driving in my car.")
}

travell {
    print("I'm driving in my car.")
}

//example 2
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
}

animate(duration: 3, animations: {
    print("Fade out the image.")
})

animate(duration: 3) {
    print("Fade out the image")
}

//example 3
func phoneFriend(conversation: () -> Void) {
    print("Calling 555-1234...")
    conversation()
}

phoneFriend{
    print("Hello!")
}

//example 4
func tendGarden(activities: () -> Void) {
    print("I love gardening.")
    activities()
}

tendGarden {
    print("Let's grow some roses!")
}

//example 5
func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}

makeCake {
    print("Mix egg and flour")
}

//ezample 6
func assembleToy(instruction: () -> Void) {
    instruction()
    print("It's done!")
}

assembleToy {
    print("Grok the glib")
    print("Flop the flip")
    print("Click the clack")
}

//example 7
func knitWear(action: () -> Void) {
    print("Buy wool")
    for _ in 1...10 {
        print("Knit knit knit...")
    }
    action()
}
knitWear {
    print("Who wants to buy a sweater?")
}

//example 8
func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}

repeatAction(count: 5) {
    print("Hello World!")
}

//example 9
func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}

goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}

//example 10
func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    activities()
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing!")
}

let drive = { (place: String) in
    print("I'm going to \(place) in my car.")
}

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

let message = drivingWithReturn("London")
print(message)

//a locuse that accepts one parameter and returns nnothing
let singing = { (singer: String) in
    print("Singing \(singer)...")
}

//a closure that accepts one parameter and returns a Boolean
let sing = { (singer: String) -> Bool in
    print("Singing \(singer)...")
    return true
}

//return a value without any parameters
let pay = { () -> Bool in
    print("Paying an anonymus person...")
    return true
}

//Returning values from a closure examples
//1
var flyDronw = { (hasPermit: Bool) -> Bool in
    if hasPermit {
        print("Let's find somewhere safe!")
        return true
    }
    print("That's against the law.")
    return false
}

//2
let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26 :
        return "XS"
    case 27...30 :
        return "S"
    case 31...34 :
        return "M"
    default :
        return "Error"
    }
}

measureSize(36)
