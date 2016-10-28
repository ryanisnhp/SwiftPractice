//
//  Library.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/24/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

final class Library {
    
    private let books: [Book]
    private let pool: Pool<Book>
    
    private init(stockLevel: Int) {
        books = [Book]()
        for count in 1...stockLevel {
            books.append(Book(author: "Dickens", title: "Hard Times", stock: count))
        }
        pool = Pool<Book>(items: books)
    }
    
    private class var singleton: Library {
        struct SingletonWrapper {
            static let singleton = Library(stockLevel: 2)
        }
        return SingletonWrapper.singleton
    }
    
    class func checkoutBook(reader: String) -> Book? {
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    class func returnBook(book: Book) {
        book.reader = nil
        singleton.pool.returnToPool(book)
    }
    
    class func printReport() {
        for book in singleton.books {
            print("...Book#\(book.stockNumber)")
            print("Checked out \(book.checkoutCount) times")
            if book.reader != nil {
                print("Checked out to \(book.reader!)")
            } else {
                print("In stock")
            }
        }
    }
}