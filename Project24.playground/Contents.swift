import UIKit

let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}

let letter = name[name.index(name.startIndex, offsetBy: 3)] //l

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[3]

let password = "12345"
password.hasPrefix("123")
password.hasSuffix("456")

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        
        return String(self.dropFirst(suffix.count))
    }
}


extension String {
    var capitalizedFirst: String {
        guard let firstLetter =  self.first else { return ""}
        
        return firstLetter.uppercased() + self.dropFirst()
    }
}


let input = "Swift is like Objective-C without the C."
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

extension String {
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
}

input.containsAny(of: languages)

languages.contains(where: input.contains)

//Attributed String
let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

//let attributedString = NSAttributedString(string: string, attributes: attributes)
let attributedString = NSMutableAttributedString(string: string)

attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 4))

//#1
extension String {
    func withPrefix(_ word: String) -> String {
        if self.contains(word) {
            return self
        } else {
            return word + self
        }
    }
}

"pet".withPrefix("car")

//#2
extension String {
    var isNumberic: Bool {
        for letter in self {
            if letter.isNumber {
                return true
            }
        }
        return false
    }
}
"swift5".isNumberic

//#3
extension String {
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
}

print("this\nis\na\ntest".lines)

extension UIView {
    func bounceOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

extension Int {
    var isPositive: Bool {
        return self > 0 ? true : false
    }
}

extension Int {
    func times(_ text: () -> ()) {
        if self.isPositive {
            for _ in 0..<self {
                text()
            }
        }
    }
}

5.times {
    print("Hello")
}


extension Array where Element: Comparable {
    mutating func remove(item: Element) {
        if let index = self.firstIndex(of: item) {
            self.remove(at: index)
        }
    }
}

var array = [1, 2, 3, 2]
array.remove(item: 2)
print(array)
