//
//  Teacher.swift
//  
//
//  Created by Sam DuBois on 9/30/22.
//

import Foundation

/// Teacher Object
///
/// The teacher has a name, id, and list of students. An instantiation of this class is made in `app.swift`
public class Teacher: Codable, Identifiable {
    
    public private(set) var id: UUID
    
    /// The full name of the teacher
    public private(set) var name: String
    
    public init(name: String) {
        self.id = UUID()
        self.name = name
    }
    
}
