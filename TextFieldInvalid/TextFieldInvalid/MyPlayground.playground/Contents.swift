//: Playground - noun: a place where people can play

import UIKit

private func validate(string: String) -> Bool {
    let regex = try? NSRegularExpression(pattern: "[0-9A-Za-z]", options: [])
    let matches = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
    let test = regex?.numberOfMatches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
    print(test)
    if let matches = matches, string.characters.count > 0 {
        return matches.count == string.characters.count
    }
    return false
}

validate(string: "4343Aa")
