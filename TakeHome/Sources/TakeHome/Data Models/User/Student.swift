//
//  Student.swift
//  
//
//  Created by Sam DuBois on 9/30/22.
//

import Foundation

/// The main student class to be used in the app
///
/// This object refers to a student. Every student has a name, id, and an array of student answers from the pages they have "interacted" with (fake data)
public class Student: Codable, Identifiable {
    
    public private(set) var id: UUID
    
    /// The name of the student. Full name
    public private(set) var name: String
    
    /// The answers they have submitted for different pages of the AppBook
    public var answers: [Answer]
    
    public init(name: String) {
        self.id = UUID()
        self.name = name
        self.answers = []
    }
}

public extension Student {
    
    func enterAnswer(for page: Page, type: Answer.ScoreType) {
        self.answers.append(Answer(pageID: page.id, type: type))
    }
}

/// A Student Answer Struct
///
/// Every student answer has a pageID associated with the answer and a score.
/// A student answer can either be randomized or standardized (the latter is entered for testing purposes)
public struct Answer: Codable, Identifiable {
    
    public private(set) var id: UUID
    
    public var pageID: UUID
    public var score: Double
    
    public init(pageID: UUID, type: ScoreType) {
        self.id = UUID()
        self.pageID = pageID
        
        switch type {
        case .randomized:
            self.score = Double.random(in: 0...1)
        case .standard:
            self.score = 0.5
        }
    }
}

public extension Answer {
    
    enum ScoreType {
        case randomized
        case standard
    }
}
