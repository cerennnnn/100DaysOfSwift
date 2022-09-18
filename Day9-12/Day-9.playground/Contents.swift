import UIKit

//initializers

struct User {
    var username: String
    
    init() {
        username = "Anonymus"
        print("Creating a new user!")
    }
}

//var user = User(username: "twostraws")

var user = User()
user.username = "twostraws"

//example - 1
struct Dictionary {
    var words = Set<String>()
}
let dictionary = Dictionary()
dictionary.words

//example - 2
struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}
Country.init(countryName: "USA")

//example - 3
struct Tree {
    var type: String
    var hasFruit: Bool
    init() {
        type = "Cherry"
        hasFruit = true
    }
}
let cherryTree = Tree()
cherryTree.type

//example - 4
struct Starship {
    var name: String
    var maxWrap: Double
    
    init(starshipNmae: String) {
        name = starshipNmae
        maxWrap = 1.0
    }
}

let voyager = Starship(starshipNmae: "Voyager")

//example - 5
struct Message {
    var from: String
    var to: String
    var content: String
    
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}

let message = Message()
message.from

//example - 6
struct PowerTool {
    var name: String
    var cost: Int
}

let drill = PowerTool(name: "Hammer Drill", cost: 80)
drill.name

//example - 7
struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

//referring to the current instance

struct Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

//example - 1
struct Conference {
    var name: String
    var location: String
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let wwdc = Conference(name: "WWDC", location: "San Jose")
wwdc.name

//example - 2
struct SuperHero {
    var nickname: String
    var powers: [String]
    init(nickname: String, superPowers: [String]) {
        self.nickname = nickname
        self.powers = superPowers
    }
}
let batman = SuperHero(nickname: "The Caped Crusader", superPowers: ["He's really rich"])
batman.powers[0]

//example - 3
struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if self.actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}

//example - 4
struct Cottage {
    var rooms: Int
    var rating = 5
    init(rooms: Int) {
        self.rooms = rooms
    }
}
let bailbrookHouse = Cottage(rooms: 4)

//example - 5
struct District {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}
let district = District(number: 9, supervisor: "Unknown")

//lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Personn {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

//Static properties and methods

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
print(Student.classSize)

//Static properties and methods

//example - 1
struct Amplifier {
    static let maximumVolume = 11
    var currentVolume: Int
}

//example - 2

struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

//example - 3

struct Cat {
    static var allCats = [Cat]()
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

//example - 4

struct FootballTeam {
    static let teamSize = 11
    var players: [String]
}

//example - 5

struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

//example - 6

struct Raffle {
    static var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets
    }
}

//example - 7

struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}

//access control
struct Personnn {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let eddd = Personnn(id: "12345")

//example - 1

struct Order {
    private var id: Int
    init(id: Int) {
        self.id = id
    }
}
let order = Order(id: 1)

//example - 2

struct Person1 {
    private var socialSecurityNumber: String
    
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person1(ssn: "555-55-5555")

//example - 4
struct Contributor {
    private var name = "Anonymous"
}
let paul = Contributor()

//example - 5

struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: "007")


//example - 6

struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])

//example - 7

struct RebelBase {
    private var location: String
    private var peopleCount: Int
    init(location: String, people: Int) {
        self.location = location
        self.peopleCount = people
    }
}
let base = RebelBase(location: "Yavin", people: 1000)

//example - 8

struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: "Mrs Hughes")

//example - 9

struct Customer {
    var name: String
    private var creditCardNumber: Int
    init(name: String, creditCard: Int) {
        self.name = name
        self.creditCardNumber = creditCard
    }
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)

//example - 10

struct Toy {
    var customerPrice: Int
    private var actualPrice: Int
    init(price: Int) {
        actualPrice = price
        customerPrice = actualPrice * 2
    }
}
let buzz = Toy(price: 10)

//example - 11

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")
