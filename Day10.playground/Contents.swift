import UIKit

//Classes
//Classes do not come with a memberwise initializer. This means you always have to create your own initializers.
//If you dont have properties u do not have to write an init method.
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

//Class Inheritance
//The second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.

//This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.
class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}
class DesignerHandbag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}
//For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.

//Method Overriding
//Child classes can replace parent methods with their own implementations – a process known as overriding.
class Cat {
    func makeNoise() {
        print("Meow!")
    }
}

class Lion: Cat {
    override func makeNoise() {
        print("Rawr")
    }
}

let lion = Lion()
lion.makeNoise()

//The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

class Singer {
    var name = "Taylor Swift"
}

//If we create an instance of that class and prints its name, we’ll get “Taylor Swift”:
var singer = Singer()
print(singer.name)

//Now let’s create a second variable from the first one and change its name:
var singerCopy = singer
singerCopy.name = "Justin Bieber"

//Because of the way classes work, both singer and singerCopy point to the same object in memory, so when we print the singer name again we’ll see “Justin Bieber”:
print(singer.name)

//On the other hand, if Singer were a struct then we would get “Taylor Swift” printed a second time.

//Deinitializers -> classes can have deinitializers – code that gets run when an instance of a class is destroyed.
//To demonstrate this, here’s a Person class with a name property, a simple initializer, and a printGreeting() method that prints a message:

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    //And now for the deinitializer. This will be called when the Person instance is being destroyed:
    deinit {
        print("\(name) is no more!")
    }
}

//We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//Mutability
//s. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant. However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

//This difference means you can change any variable property on a class even when the class is created as a constant – this is perfectly valid code:

class Singer2 {
    var name = "Taylor Swift"
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)
//If you want to stop that from happening you need to make the property constant:

class Singer3 {
    let name = "Taylor Swift"
}

