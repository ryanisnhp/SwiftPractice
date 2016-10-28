//: Playground - noun: a place where people can play

import UIKit

//In cac mua ra man hinh

enum Season: Int {
    case Spring = 0
    case Summer
    case Autumn
    case Winter
    case NoSeason
}

class SeasonPrint {
    subscript(input: Int) -> Season {
        if let season = Season(rawValue: input) {
            return season
        } else {
            return Season.NoSeason
        }
    }
}

let seasonPrint = SeasonPrint()
seasonPrint[1]