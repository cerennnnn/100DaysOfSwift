import UIKit
import Darwin

//protocols
//protocol Identifiable {
//    var id: String{ get set}
//}

//struct User: Identifiable {
//    var id: String
//}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//example - 1
protocol Swimmable {
    var depth: Int { get }
}

//example - 2
protocol Purchaseable {
    var price: Double { get set }
    var currency: String { get set }
}

//example - 3
protocol Climbable {
    var heigh: Double { get }
    var gradient: Int { get }
}

//example - 4
protocol Mailable {
    var width: Double { get set }
    var height: Double { get set }
}

//example - 5
protocol Singable {
    var lyrics: [String] {get set}
    var notes: [String] {get set}
}

//protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

//example - 1
protocol MakesDiagnoses {
    func evaluate(patient: String) -> String
}
protocol PrescribesMedicine {
    func prescribe(drug: String)
}
protocol Doctor: MakesDiagnoses, PrescribesMedicine { }

//example - 2
protocol Buyable {
    var cost: Int { get }
}

protocol Sellable {
    func findBuyers() -> [String]
}

protocol FineArt: Buyable, Sellable { }

//example - 3
protocol CarriesPassengers {
    var passengerCount: Int { get set }
}

protocol CarriesCargo {
    var cargoCapacoty: Int { get set}
}

protocol Boat: CarriesPassengers, CarriesCargo {
    var name: String { get set }
}

//example - 4
protocol GivesOrders {
    func makeItSo()
}
protocol OrdersDrinks {
    func teaEarlGrey(hot: Bool)
}
protocol StarshipCaptain: GivesOrders, OrdersDrinks { }

//example - 5
protocol Scoreable {
    func add()
}
protocol Winnable {
    func makeWinningSpeech()
}
protocol Competitor: Scoreable, Winnable { }

//extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

//example - 1
extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

//example - 2
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//example - 3

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

//example - 4

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

//example - 5
extension Array {
    func summarize() {
        print("The array has \(count) items. They are:")
        for item in self {
            print(item)
        }
    }
}

// example - 6
extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}

//example - 7
extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}

//example - 8
extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

//example - 9
extension String {
    var isLong: Bool {
        return count > 25
    }
}
let a:String = "asddaad"
a.isLong

//example - 10
extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}
let b: String = "isTrue"
b.withPrefix("is")

//example - 11
extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}
let c = "STRAY KIDS"
c.isUppercased()

//protocol extensions
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George","Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

//example - 1
protocol Chief {
    func getRecipes() -> [String]
}

extension Chief {
    func getRecipes() -> [String] {
        return ["Macaroni Cheese"]
    }
}

//example - 2
protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()
}
extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}

//example - 3

protocol Anime {
    var availableLanguages: [String] { get set }
    func watch(in language: String)
}
extension Anime {
    func watch(in language: String) {
        if availableLanguages.contains(language) {
            print("Now playing in \(language)")
        } else {
            print("Unrecognized language.")
        }
    }
}

//example - 4
protocol Club {
    func organizeMeeting(day: String)
}
extension Club {
    func organizeMeeting(day: String) {
        print("We're going to meet on \(day).")
    }
}

//example - 5
protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func writeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}

//example - 6
protocol Mammal {
    func eat()
}
extension Mammal {
    func eat() {
        print("Time for dinner!")
    }
}

//example - 7
protocol Bartender {
    func makeDrink(name: String)
}
extension Bartender {
    func makeDrink(name: String) {
        print("One \(name) coming right up.")
    }
}

//example - 8
protocol Hamster {
    var name: String { get set }
    func runInWheel(minutes: Int)
}
extension Hamster {
    func runInWheel(minutes: Int) {
        print("\(name) is going for a run.")
        for _ in 0..<minutes {
            print("Whirr whirr whirr")
        }
    }
}

//example - 9
protocol Starship {
    func transport(number: Int)
}
extension Starship {
    func transport(number: Int) {
        print("\(number) to beam up - energize!")
    }
}

//example - 10
protocol Fencer {
    func fenceFoil()
}
extension Fencer {
    func fenceFoil() {
        print("En garde!")
    }
}

//protocol-oriented programming
protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()

//summary
//example - 1
protocol HasAge {
    var age: Int { get set }
    mutating func celebrateBirthday()
}

//example - 2
protocol Paintable { }
protocol Tileable { }
struct Wall: Paintable, Tileable { }

//example - 3
extension Collection {
    func describe() {
        if count == 1 {
            print("There is 1 item.")
        } else {
            print("There are \(count) items.")
        }
    }
}

//example - 4

protocol CanFly {
    var maximumFlightSpeed: Int { get set }
}
protocol CanDrive {
    var maximumDrivingSpeed: Int { get set }
}
struct FlyingCar: CanFly, CanDrive {
    var maximumFlightSpeed: Int
    
    var maximumDrivingSpeed: Int
}

//example - 5

protocol TravelsThroughTime {
    mutating func travel(to year: Int)
}
protocol BiggerOnTheInside {
    func findSwimmingPool()
}
protocol TARDIS: TravelsThroughTime, BiggerOnTheInside {
    var doctorNumber: Int { get set }
}

//example - 6

protocol Inflatable {
    mutating func refillAir()
}
extension Inflatable {
    mutating func refillAir() {
        print("Refilling the air.")
    }
}

//example - 7

protocol SuitableForKids {
    var minimumAge: Int { get set }
    var maximumAge: Int { get set }
}
protocol SupportsMultiplePlayers {
    var minimumPlayers: Int { get set }
    var maximumPlayers: Int { get set }
}
struct FamilyBoardGame: SuitableForKids, SupportsMultiplePlayers {
    var minimumAge = 3
    var maximumAge = 110
    var minimumPlayers = 1
    var maximumPlayers = 4
}

//example - 8

protocol HasPages {
    var pageCount: Int { get }
}
protocol HasTableOfContents {
    var titles: [String] { get}
}
protocol Book: HasPages, HasTableOfContents {
    var author: String { get }
}

