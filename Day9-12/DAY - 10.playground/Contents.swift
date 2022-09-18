import UIKit

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed:String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

//example 1
class Painting {
    var title: String
    var artist: String
    var paintType: String
    
    init(title: String, artist: String, paintType: String) {
        self.title = title
        self.artist = artist
        self.paintType = paintType
    }
}

//example - 2
class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}
//print(minimumPlayers)

//example - 3
class TIE {
    var name: String
    var speed: Int
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}

let fighter = TIE(name: "TIE fighter", speed: 50)
let interceptor = TIE(name: "TIE Interceptor", speed: 70)

fighter.name
fighter.speed

//example - 4
class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}

let monkeyIsIsland = VideoGame(heroName: "Guybrush Threepwood", enemyName: "LeChuck")
monkeyIsIsland.hero

//example - 5
class ThemePark {
    var entryPrice: Int
    var rides: [String]
    init(rides: [String]) {
        self.rides = rides
        self.entryPrice = rides.count * 2
    }
}

//example - 6

class Empty { }
let nothing = Empty()

//example - 7

class Attendee {
    var badgeNumber = 0
    var name = "Anonymous"
    var company = "Unknown"
    init(badge: Int) {
        self.badgeNumber = badge
    }
}

//example - 8

class Podcast {
    var hosts: [String]
    init(hosts: [String]) {
        self.hosts = hosts
    }
}

//example - 9

class Singer {
    var name: String
    var favoriteSong: String
    init(name: String, song: String) {
        self.name = name
        self.favoriteSong = song
    }
}
let taylor = Singer(name: "Taylor Swift", song: "Blank Space")
taylor.favoriteSong

//class inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

//example - 1
class Vehicle {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Truck: Vehicle {
    var goodsCapacoty: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacoty = goodsCapacity
        super.init(wheels: 1)
    }
}

//ezample - 2
class Student {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class UniversityStudent: Student {
    var annualFees: Int
    init(name: String, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name: name)
    }
}

var student = UniversityStudent(name: "hyunjin", annualFees: 0)

student.name

//example - 3
class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}

class DesignerHandBag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}

//example - 4
class Product {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Book: Product {
    var isbn: String
    init(name: String, isbn: String) {
        self.isbn = isbn
        super.init(name: name)
    }
}

//example - 5
class Computer {
    var cpu: String
    var ramGB: Int
    init(cpu: String, ramGB: Int) {
        self.cpu = cpu
        self.ramGB = ramGB
    }
}

class Laptop: Computer {
    var screenInches: Int
    init(screenInches: Int, cpu: String, ramGB: Int) {
        self.screenInches = screenInches
        super.init(cpu: cpu, ramGB: ramGB)
    }
}

//example - 6
class Bicycle {
    var color: String
    init(color: String) {
        self.color = color
    }
}

class MountainBike: Bicycle {
    var tireThickness: Double
    init(color: String, tireThickness: Double) {
        self.tireThickness = tireThickness
        super.init(color: color)
    }
}

//example - 7
class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}

//oveerriding methods
class Dog1 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle1: Dog1 {
    override func makeNoise() {
        print("Yip")
    }
}

let puppy = Poodle1()
puppy.makeNoise()

//examaple - 1

class Appliance {
    func start() {
        print("Starting...")
    }
}

class Oven: Appliance {
    
}

let oven = Oven()
oven.start()

//example - 2
class Band {
    func singSong() {
        print("Here's a new song.")
    }
}

class MetalBand: Band {
    override func singSong() {
        print("Ruuuuh ruh ruh ruuuuuuh!")
    }
}

let lordi = MetalBand()
lordi.singSong()

//example - 3
class Watch {
    func tellTime() {
        print("It's 9:41")
    }
}

class SmartWatch: Watch {
    override func tellTime() {
        print("It's 9:41")
    }
}

let appleWatch = SmartWatch()
appleWatch.tellTime()

//example - 4

class Composer {
    func composeMusic() {
        print("Here's some music I wrote.")
    }
}

class OperaComposer: Composer {
    override func composeMusic() {
        print("Here's some opera I wrote.")
    }
}

let verdi = OperaComposer()
verdi.composeMusic()

//example - 5

class Doctor {
    func operate() {
        print("I can't do that.")
    }
}
class Surgeon: Doctor {
    override func operate() {
        print("OK, let's go!")
    }
}
let doogieHowser = Surgeon()
doogieHowser.operate()

//example - 6

class Store {
    func restock() -> String {
        return "Fill up the empty shelves"
    }
}
class GroceryStore: Store {
    override func restock() -> String {
        return "We need to buy more food."
    }
}
let tesco = GroceryStore()
tesco.restock()

//final classes
final class Dog2 {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//example - 1
class Magazine { }
final class FashionMagazine: Magazine { }

//copying objects
class Singer1 {
    var name = "Taylor Swift"
}

var singer = Singer1()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

//example - 1
struct GalacticaCrew {
    var isCylon = false
}

var starbuck = GalacticaCrew() //instance of GalacticaCrew class
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)

//example - 2
class Statue {
    var sculpter = "Unknown"
}

var venusDeMilo = Statue()
venusDeMilo.sculpter = "Alexandros of Antioch"

var david = Statue()
david.sculpter = "Michaelangelo"
print(venusDeMilo.sculpter)
print(david.sculpter)

//example - 3
class Starship {
    var maxWarp = 9.0
}

var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

//example - 4
class Hairdresser {
    var clients = [String]()
}
var tim = Hairdresser()
tim.clients.append("Jess")
var dave = tim
dave.clients.append("Sam")
print(tim.clients.count)
print(dave.clients.count)

//deinitializers
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }

}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//example - 1
class Job {
    deinit {
        print("I quit!")
    }
}

//mutability
class Singer6 {
    let name = "TS"
}

//example - 1
class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")

//example -2
struct Kindergarten {
    var numberOfScreamingKids = 30
    mutating func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
var kindergarten = Kindergarten()
kindergarten.handOutIceCream()

//example - 3
class Light {
    var onState = false
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}
let light = Light()
light.toggle()

//example - 4
struct Code {
    var numberOfBugs = 100
    mutating func fixBug() {
        numberOfBugs += 3
    }
}
var code = Code()
code.fixBug()

//example - 5
class Phasers {
    var energyLevel = 100
    func firePhasers() {
        if energyLevel > 10 {
            print("Firing!")
            energyLevel -= 10
        }
    }
}
var phasers = Phasers()
phasers.firePhasers()

//example - 6
struct Barbecue {
    var charcoalBricks = 20
    mutating func addBricks(_ number: Int) {
        charcoalBricks += number
    }
}
var barbecue = Barbecue()
barbecue.addBricks(4)
