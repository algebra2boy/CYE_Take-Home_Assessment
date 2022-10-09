import XCTest
@testable import TakeHome

final class TakeHomeTests: XCTestCase {
    
    private var th = TakeHome()
    
    func testBookExists() throws {
        
        // Validate title of AppBook
        XCTAssertTrue(th.example_book.title == "Intro to Spanish Book 1")
        
        // Validate pages for those editions exist
        XCTAssertTrue(th.example_book.pages.count > 0)
    }
    
    func testTeacherExists() throws {
        // Validate the name of the teacher
        XCTAssertTrue(th.example_teacher.name == "Sēnor Ben Cheng")
    }
    
    func testStudentsExist() throws {
        // Validate students exist
        XCTAssertTrue(th.example_students.count > 0)
    }
    
    func testPopulateStudentAnswers() throws {
        let student = Student(name: "Test Student")
        let page = Page(title: "Test Page")
        
        student.enterAnswer(for: page, type: .standard)
        
        // Validate an answer exists
        XCTAssertTrue(student.answers.count == 1)
        
        // Validate that the page id's are the same
        XCTAssertTrue(page.id == student.answers[0].pageID)
        
        // Validate that the value is accurate
        XCTAssertTrue(student.answers[0].score == 0.5)
    }
    
    //
    // Write your tests here!
    //
}
