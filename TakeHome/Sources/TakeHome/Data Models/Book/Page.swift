//
//  Page.swift
//  
//
//  Created by Sam DuBois on 9/30/22.
//

import Foundation

/// An AppBook Page
///
/// This object is an extremely basic version of a page. All it has is an id and title (to distinguish from other pages. Assume that the "content" of this page is the title.
public struct Page: Codable, Identifiable {
    
    public private(set) var id: UUID
    
    /// The title (or content) of the page
    public var title: String
    
    public init(title: String) {
        self.id = UUID()
        self.title = title
    }
    
    // class
}
