//
//  Book.swift
//  
//
//  Created by Sam DuBois on 9/30/22.
//

import Foundation

/// `Book` Data Model
///
/// This is the precipice of the data model. The `Book` model contains important meta data related to the book as well as it's pages (content).
public struct Book {
    
    /// A unique identifier that distinguishes this book from any other
    public private(set) var id: UUID
    
    /// The title of the book
    public var title: String
    
    /// A short description of the purpose of this book
    public var description: String
    
    /// The different versions (editions) of the book ordered from newest to oldest
    public private(set) var pages: [Page]
    
    /// Generic initializer
    public init(title: String, description: String, pages: [Page]) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.pages = pages
    }
}
