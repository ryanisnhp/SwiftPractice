//: Playground - noun: a place where people can play

import UIKit

enum ConnectionState<T, U> {
    case Unknown
    case Disconnected(T)
    case Connecting(U)
    case Connected(T)
}

var connectionState = ConnectionState<Bool, (Int, Double)>.Disconnected(Bool())
switch connectionState {
case .Unknown:
    print("Unknown")
case .Disconnected(let value):
    print("Dis connectionted with \(value)")
case .Connecting(let (value1, value2)):
    print("value 1 = \(value1) ^^ \(value2)")
case .Connected(let value):
    print("value2")
}