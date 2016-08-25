//: Playground - noun: a place where people can play

import Foundation

class BoardGameManager {
    
    //Simple
//    static let sharedInstance = BoardGameManager()
    
    class var sharedInstance: BoardGameManager {
        struct SingletonWrapper {
            static let singleton = BoardGameManager()
        }
        return SingletonWrapper.singleton
    }
    init() {
        print("Singleton initialized")
    }
}

let singleton = BoardGameManager.sharedInstance
