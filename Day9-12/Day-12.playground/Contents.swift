import UIKit

//optionals
var name: String? = nil

name = "Taylor"
 
//optional unwrapping
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//example - 1
func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}

//example - 2
var favoriteMove: String? = nil
favoriteMove = "The Life of Brian"
if let movie = favoriteMove {
    print("Your favorite movie is \(movie).")
} else {
    print("You don't have a favorite movie.")
}

//example - 3
let song: String? = "Shake it Off"
if let unwrappedSong = song {
    print("The name has \(unwrappedSong.count) letters.")
}

//example - 4
let currentDestination: String? = nil
if let destination = currentDestination {
    print("We're walking to \(destination).")
} else {
    print("We're just wandering.")
}

//example - 5
let menuItems: [String]? = ["Pizza", "Pasta"]
if let items = menuItems {
    print("There are \(items.count) items to choose from.")
}

//example - 6
let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

//example - 7
//let userAge: Int? = 38
//if let age = userAge {
//    print("You are \(age) years old.")
//}

//example - 8

let favoriteTennisPlayer: String? = "Andy Murray"
if let player = favoriteTennisPlayer {
    print("Let's watch \(player)'s highlights video on YouTube.")
}

//example - 9
var winner: String? = nil
winner = "Daley Thompson"
if let name = winner {
    print("And the winner is... \(name)!")
}

//example - 10
var bestScore: Int? = nil
bestScore = 101
if let score = bestScore {
    if score  > 100 {
        print("You got a high score!")
    }
    print("You don't got a high score!")
    
} else {
    print("Better luck next time.")
}

//unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name.")
        return
    }
    print("Hello, \(unwrapped)!")
}

//unwrapping with guard
//example - 1
func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}

//example - 2
func playOpera(by composer: String?) -> String? {
    guard let composer = composer else {
        return "Please specify a composer."
    }
    if composer == "Mozart" {
        return "Le nozze di Figaro"
    } else {
        return nil
    }
}
if let opera = playOpera(by: "Mozart") {
    print(opera)
}

//example - 3
func playScale(name: String?) {
    guard let name = name else { return }
    print("Playing the \(name) scale.")
}
playScale(name: "C")

//example - 4
func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}
if let result = uppercase(string: "Hello") {
    print(result)
}

//example - 5
func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else { return false }
    if string.count >= 8 {
        return true
    } else {
        return false
    }
}
if isLongEnough("Mario Odyssey") {
    print("Let's play that!")
}

//example - 6

func validate(password: String?) -> Bool {
    guard let password = password else {
        return false
    }
    if password == "fr0sties" {
        print("Authenticated successfully!")
        return true
    }
    return false
}
validate(password: "fr0sties")

//example - 7
func test(number: Int?) {
    guard let number = number else { return }
    print("Number is \(number)")
}
test(number: 42)

//example - 8
func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

//example - 9

func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You don't have a job.")
        return
    }
    print("You are an \(occupation).")
}
let job = "engineer"
describe(occupation: job)

//example - 10
func plantTree(_ type: String?) {
    guard let type = type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")

//force unwrapping
let str = "5"
let num = Int(str)!

//example - 1
func describe(array: [String]?) {
    let unwrapped = array!
    print("The array has \(unwrapped.count) items.")
}
describe(array: [])

////example - 2
//let age: Int = 21
//let allowedMessage: String? = age >= 21 ? "Welcome!" : nil
//let result = allowedMessage!

//example - 3
func league(for skillLevel: Int) -> Int? {
    switch skillLevel {
    case 1:
        fallthrough
    case 2:
        return 3
    case 3:
        return 2
    case 4:
        return 1
    default:
        return nil
    }
}
let allocatedLeague = league(for: 3)!

//example - 4
struct User {
    var name: String?
    var age: Int?
}
let taylor = User(name: "Taylor", age: 26)
let taylorAge = taylor.age!

//example - 5

func title(for page: Int) -> String? {
    guard page >= 1 else {
        return nil
    }
    let pageCount = 132
    if page < pageCount {
        return "Page \(page)"
    } else {
        return nil
    }
}
let pageTitle = title(for: 16)!

//example - 6
let legoBricksSold: Int? = 400_000_000_000
let numberSold = legoBricksSold!

//implicitly unwrapped optionals
let age: Int! = nil

//nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) 

//example - 1
let bestPony: String? = "Pinkie Pie"
let selectedPony: String? = bestPony ?? nil

//example - 2
let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

//example - 3
var captain: String? = "Kathryn Janeway"
let name1 = captain ?? "Anonymous"

//example - 4

var conferenceName: String? = "WWDC"
var conference: String = conferenceName ?? "wrong"

//example - 5

let planetNumber: Int? = 426
var destination = planetNumber ?? 3

//example - 6

let userID: Int? = 556
let id = userID ?? 0

//example - 7

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

//example - 8

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false

//example - 9

let jeansNumber: Int? = nil
let jeans = jeansNumber ?? 501

//example - 10

var selectedYear: Int? = nil
let actualYear = selectedYear ?? 1989

//optional chaining
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

//example - 1
let names1 = ["Taylor", "Paul", "Adele"]
let lengthOfLast = names1.last?.count

//example - 2

let credentials = ["twostraws", "fr0sties"]
let lowercaseUsername = credentials.first?.lowercased()

//example - 3

let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

//example - 4
func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album1 = albumReleased(in: 2006)?.uppercased()

//example - 5

let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")

//example - 6
let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

//example - 7
let favoriteColors = ["Paul": "Red", "Charlotte": "Pink"]
let charlotteColor = favoriteColors["Charlotte"]?.lowercased()

//example - 8
let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")

//failable initializers
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//example - 1
struct Password {
    var text: String
    init?(input: String) {
        if input.count < 6 {
            print("Password too short.")
            return nil
        }
        text = input
    }
}
let password = Password(input: "hell0")

//example - 2
struct Website {
    var url: String
    init?(url: String) {
        if url.hasPrefix("http") {
            self.url = url
        } else {
            print("Invalid website URL.")
            return nil
        }
    }
}
let site = Website(url: "https://www.hackingwithswift.com")

//example - 3

struct DEFCONRating {
    var number: Int
    init?(number: Int) {
        guard number > 0 else { return nil }
        guard number <= 5 else { return nil }
        self.number = number
    }
}
let defcon = DEFCONRating(number: 6)

//example - 4

class Hotel {
    var starRating: Int
    init?(rating: Int) {
        if rating <= 1 {
            print("This probably has bed bugs.")
            return nil
        }
        self.starRating = rating
    }
}
let hotelElan = Hotel(rating: 1)

//example - 5
class Camel {
    var humps: Int
    init?(humpCount: Int) {
        guard humpCount <= 2 else { return nil }
        humps = humpCount
        print(humpCount)
    }
}
let horse = Camel(humpCount: 0)

//example - 6
struct Language {
    var code: String
    init?(code: String) {
        if code.hasPrefix("en-") {
            self.code = code
        } else {
            print("Sorry, only English variants are supported." )
            return nil
        }
    }
}
let language = Language(code: "en-GB")

//typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

//example - 1
class Person3 {
    var name = "Anonymous"
}
class Customer: Person3 {
    var id = 12345
}
class Employee: Person3 {
    var salary = 50_000
}

let customer = Customer()
let employee = Employee()
let people = [customer, employee]

for person in people {
    if let customer = person as? Customer {
        print("I'm a customer, with id \(customer.id)")
    } else if let employee = person as? Employee {
        print("I'm an employee, earning $\(employee.salary)")
    }
}


//example - 2
class Museum {
    var name = "National Museum"
}
class HistoryMuseum: Museum { }
class ToyMuseum: Museum { }
let museum = ToyMuseum()
if let unwrappedMuseum = museum as? ToyMuseum {
    print("This is the \(unwrappedMuseum.name).")
}

//example - 3
class Person4 {
    var name = "Taylor Swift"
}
class User4: Person4 { }
let taylor0 = User4()
if let user = taylor0 as? User4 {
    print("\(user.name) is a user.")
}

//example - 4
let flavor = "apple and mango"
if let taste = flavor as? String {
    print("We added \(taste).")
}

//example - 5
class Phone {
    var model = "Unknown"
}
class Smartphone: Phone { }
let iPhone = Smartphone()
if let phone = iPhone as? Phone {
    print("The model is: \(phone.model).")
}

//example - 6

let distances = [23, 28, 22]
if let stringDistances = distances as? [Int] {
    for distance in stringDistances {
        print("The distance was \(distance).")
    }
}

//example - 7

class Transport { }
class Train: Transport {
    var type = "public"
}
class Car: Transport {
    var type = "private"
}
let travelPlans = [Train(), Car(), Train()]
for plan in travelPlans {
    if let train = plan as? Train {
        print("We're taking \(train.type) transport.")
    }
}

//example - 8
var socialMediaSite = "Twitter"
if let site = socialMediaSite as? String {
    print("The site is \(site)")
}

//example - 9
class CitrusFruit {
    var averagePH = 3.0
}
class Orange: CitrusFruit { }
let citrus = Orange()
if let orange = citrus as? Orange {
    print("This orange has a pH of \(orange.averagePH).")
}

//example - 10
class Bird {
    var wingspan: Double? = nil
}
class Eagle: Bird { }
let bird = Eagle()
if let eagle = bird as? Eagle {
    if let wingspan = eagle.wingspan {
        print("The wingspan is \(wingspan).")
    } else {
        print("This bird has an unknown wingspan.")
    }
}

class Reading {
    var value = 0.0
}

//example - 11
class TemperatureReading: Reading { }
let temperature = TemperatureReading()
if let reading = temperature as? Reading {
    print("The reading is \(reading.value).")
}

//summary
//example - 1
func mowGrass(to height: Double?) {
    guard let height = height else { return }
    print("Mowing the grass to \(height).")
}
mowGrass(to: 6.0)

//example - 2
let coffee: String? = "Cappuccino"
let unwrappedCoffee: String = coffee!

//example - 3
func process(order: String) {
    print("OK, I'll get your \(order).")
}
let pizzaRequest: String! = "pizza"
process(order: pizzaRequest)

//example - 4
enum NetworkError: Error {
    case insecure
    case noWifi
}
func downloadData(from url: String) throws -> String {
    if url.hasPrefix("https://") {
        return "This is the best Swift site ever!"
    } else {
        throw NetworkError.insecure
    }
}
if let data = try? downloadData(from: "https://www.hackingwithswift.com") {
    print(data)
} else {
    print("Unable to fetch the data.")
}

//example - 5
let owlVariety: String? = nil
print(owlVariety ?? "Unknown owl")

//example - 6
struct Dog1 {
    var name: String
    init?(name: String) {
        guard name == "Lassie" else {
            print("Sorry, wrong dog!")
            return nil
        }
        self.name = name
    }
}
let dog = Dog1(name: "Fido")

//example - 7
let cat: String? = "Toby"
if let cat = cat {
    print("The cat's name is \(cat).")
}

//example - 8
func brewBeer(to strength: Double?) {
    guard let strength = strength else { return }
    print("Let's brew some beer!")
}
brewBeer(to: 5.5)
