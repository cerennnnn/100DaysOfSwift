import UIKit

//creating your own structs
//struct Sport {
//    var name: String
//}
//
//var tennis = Sport(name: "Tennis")
//print(tennis.name)
//
//tennis.name = "Lawn tennis"


//example - 1
struct Order {
    var customerID: Int
    var itemID: Int
}
var order = Order(customerID: 143, itemID: 556)
print(order.customerID)

//example - 2
struct User {
    var name = "Anonymus"
    var age: Int
}
let twostraws = User(name: "Paul", age: 38)
let a = User(age: 32)
print(a.name)
print(twostraws.age, twostraws.name)

//example =- 3
struct LeviJeans {
    var fitNumber: Int
    var waist: Int
    var leg: Int
}

LeviJeans(fitNumber: 501, waist: 34, leg: 32)

//computed properties
struct Sport {
    var name: String
    var isOlympic: Bool
    
    var olympicStatus: String {
        if isOlympic {
            return "\(name) is an Olympic sport."
        } else {
            return "\(name) is not an Olympic sport."
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympic: false)
print(chessBoxing.olympicStatus)

//computed properties
//example - 1
struct Code {
    var language: String
    var containsErrors = false
    var report: String {
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}

var result = Code(language: "English", containsErrors: false)
print(result.report)

//example - 2
struct City {
    var population: Int
    var description: String {
        if population < 100_000 {
            return "This is a small city."
        } else if population < 1_000_000 {
            return "This is a medium-sized city."
        } else {
            return "This is a large city."
        }
    }
}
let tokyo = City(population: 12_000_000)
print(tokyo.description)

//example - 3
struct Candle {
    var burnLength: Int
    var alreadyBurned = 0
    var burnRemaining: Int {
        return burnLength - alreadyBurned
    }
}

let candle1 = Candle(burnLength: 3)
let candle2 = Candle(burnLength: 3, alreadyBurned: 3)
print(candle1.alreadyBurned)
print(candle2.alreadyBurned)

//example - 4
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

//example - 5
struct Dog {
    var breed: String
    var cuteness: Int
    var rating: String {
        if cuteness < 3 {
            return "That's a cute dog!"
        } else if cuteness < 7 {
            return "That's a really cute dog!"
        } else {
            return "That a super cute dog!"
        }
    }
}
let luna = Dog(breed: "Samoyed", cuteness: 11)
print(luna.rating)

//example - 6
struct Sunglasses {
    var protectionLevel: Int
    var visionTest: String {
        if protectionLevel < 3 {
            return "These aren't very dark"
        } else if protectionLevel < 6 {
            return "These are just right"
        } else {
            return "Who turned the lights out?"
        }
    }
}

let result2 = Sunglasses(protectionLevel: 11)
print(result2)

//example - 7
struct Race {
    var distance: Int
    var runners = 0
    var description: String {
        return "This is a \(distance)km race with \(runners) runners."
    }
}
let londonMarathon = Race(distance: 42, runners: 40_000)
print(londonMarathon.description)

//example - 8
struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
}
let majestouch = Keyboard(isMechanical: true)
print(majestouch.noiseLevel)

//example - 9
struct Investor {
    var age: Int
    var investmentPlan: String {
        if age < 30 {
            return "Shares"
        } else if age < 60 {
            return "Equities"
        } else {
            return "Bonds"
        }
    }
}
let investor = Investor(age: 38)
print(investor.investmentPlan)

//property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount) complete.")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//example - 1
struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

var result3 = BankAccount(name: "a", isMillionnaire: true, balance: 1_000_001)

print(result3.balance)

//example - 2
struct App {
    var name: String
    var isOnSale: Bool {
        didSet {
            if isOnSale {
                print("Go and download my app!")
            } else {
                print("Maybe download it later.")
            }
        }
    }
}

//example - 3
struct Child {
    var name: String
    var age: Int {
        didSet {
            print("Happy birthday, \(name)!")
        }
    }
}

var result4 = Child(name: "Apple", age: 46)
result4.age = 46

//example - 4
struct Person {
    var clothes: String {
        didSet {
            print("I'm changing to \(clothes)")
        }
    }
}

var result5 = Person(clothes: "pants")
result5.clothes = "shirt"

//example - 5
struct FootballMatch {
    var homeTeamScore: Int {
        didSet {
            print("Yay - we scored!")
        }
    }
    var awayTeamScore: Int {
        didSet {
            print("Boo - they scored!")
        }
    }
}

//methods
struct City1 {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City1(population: 9_000_000)
london.collectTaxes()

//example - 1
struct Student {
    var name: String
    var sleepy: Bool
    func study() {
        if sleepy {
            print("I'm too tired right now.")
        } else {
            print("I'm hitting the books!")
        }
    }
}

let student = Student(name: "sleepy", sleepy: true)
student.study()

//example - 2
struct Event {
    var ticketPrices = [100, 200, 500]
    func buyTickets(type: Int) {
        let cost = ticketPrices[type]
        print("That'll be $\(cost), please.")
    }
}

var event = Event()
event.buyTickets(type: 2)

//example - 3
struct Pokemon {
    var name: String
    func attack(with attackType: String) {
        print("\(name) uses \(attackType)!")
    }
}

//example - 4

struct Venue {
    var name: String
    var maximumCapacity: Int
    func makeBooking(for people: Int) {
        if people > maximumCapacity {
            print("Sorry, we can only accommodate \(maximumCapacity).")
        } else {
            print("\(name) is all yours!")
        }
    }
}

//example - 5
struct Userr {
    var name: String
    var street: String
    var city: String
    var postalCode: String
    func printAddress() -> String {
        return """
        \(name)
        \(street)
        \(city)
        \(postalCode)
        """
    }
}

//example - 6
struct XWing {
    var callSign: String
    func startTrenchRun() -> Bool {
        if callSign == "Red 5" {
            print("I'm going to blow up the Death Star!")
            return true
        } else {
            print("I'm hit!")
            return false
        }
    }
}


//mutating methods

struct Person2 {
    var name: String
    
    mutating func makeAnonymus() {
        name = "Anonymus"
    }
}

var person = Person2(name: "Ed")
person.makeAnonymus()
person.name

//example - 1
struct Diary {
    var entries: String
    mutating func add(entry: String) {
        entries += "\(entry)"
        print(entries)
    }
}

var diary = Diary(entries: "dear ")
diary.add(entry: "diary")

//example - 2
struct Surgeon {
    var operationsPerformed = 0
    mutating func operate(on patient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}

//example - 3
struct Stapler {
    var stapleCount: Int
    mutating func staple() {
        if stapleCount > 0 {
            stapleCount -= 1
            print("It's stapled!")
        } else {
            print("Please refill me.")
        }
    }
}

//example - 4

struct Book {
    var totalPages: Int
    var pagesLeftToRead = 0
    mutating func read(pages: Int) {
        if pages < pagesLeftToRead {
            pagesLeftToRead -= pages
        } else {
            pagesLeftToRead = 0
            print("I'm done!")
        }
    }
}

//example - 5
struct BaankAccount {
    var balance: Int
    mutating func donateToCharity(amount: Int) {
        balance -= amount
    }
}

//example - 6
struct Switch {
    var isOn: Bool
    mutating func toggle() {
        if isOn {
            isOn == false
        } else {
            isOn == true
        }
    }
}

//example - 7

struct MeetingRoom {
    var isBooked = true
    mutating func book(for name: String) {
        if isBooked {
            print("Sorry, the meeting room is already taken.")
        } else {
            isBooked = true
            print("It's reserved for \(name).")
        }
    }
}

//example - 8

struct Delorean {
    var speed = 0
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}

//example - 9

struct Bicycle {
    var currentGear: Int
    mutating func changeGear(to newGear: Int) {
        currentGear = newGear
        print("I'm now in gear \(currentGear).")
    }
}

//properties and methods of arrays

