import Foundation

@main
public struct TakeHome {
    
    /// Our Book Object
    ///
    /// This is the main book of the application (for demonstration purposes). It contains two editions each with 10 pages.
    public var example_book = Book(
        title: "Intro to Spanish Book 1",
        description: "This is an example book with fake pages",
        pages: [
            Page(title: "Page 1"),
            Page(title: "Page 2"),
            Page(title: "Page 3"),
            Page(title: "Page 4"),
            Page(title: "Page 5"),
            Page(title: "Page 6"),
            Page(title: "Page 7"),
            Page(title: "Page 8"),
            Page(title: "Page 9"),
            Page(title: "Page 10"),
        ]
    )
    
    /// An example teacher to use for the assessment
    public var example_teacher: Teacher = Teacher(name: "Sēnor Ben Cheng")
    
    /// An example list of students
    public var example_students: [Student] = [
        Student(name: "Abed Nadir"),
        Student(name: "Britta Perry"),
        Student(name: "Troy Barnes"),
        Student(name: "Pierce Hawthorne"),
        Student(name: "Jeff Winger"),
        Student(name: "Annie Edison"),
        Student(name: "Shirley Bennett"),
    ]
    
    
    /// This is where you will run your code to ensure that it works as desired. Upon pressing the play button in Xcode (or running the script in terminal), the code in this function will be executed.
    public static func main() {
        
        let th = TakeHome()
        
        // Add the list of students to the teacher
        //th.example_teacher.students = th.example_students
        
        // Populate Student Data
        th.generateFakeStudentData(.randomized)
//      th.generateFakeStudentData(.standardized) // Uncomment for non-random data
        
        th.challengeOne()
        th.challengeTwo()
        th.challengeThree()
    }
}

/// YOUR ANSWERS GO HERE !!
///
/// This is where you will write most of your code for the three challenges. Keep in mind that some of the challenges require you to make new files or change existing ones. If you have anything print to the terminal make sure it goes in here!!!
/// - Note: Feel free to delete any code in the functions below!
public extension TakeHome {
    
    /// print out the page number and the score of a student, round it to hundredth places, and represent the score in percentage
    /// each page will be printed in the format of "Page <Page #>: <score in percentage>"
    /// example : Page 931F46BD-F7BC-4357-BD35-B61840DDC5A3: 4.0945%
    func printPageAndScore(answer: Answer) {
        // go through the pages and find the id of the page, and match it with the pageID belongs to that answer
        for page in self.example_book.pages {
            if (page.id == answer.pageID) {
                print("\(page.title): \(String(format: "%.2f", answer.score*100))%")
                break
            }
        }
    }
    
    func challengeOne() {
        
        /// retrieve the first student in the array
        let first_student: Student =  self.example_students[0]
        
        print("\(first_student.name):")
        
        /// print out all the pages completed by the first student
        for answer in first_student.answers {
            printPageAndScore(answer: answer)
        }
    
        print("Book: \(example_book.title)")
        
    }
    
    func challengeTwo() {
        
        let example_class = Class(teacher: self.example_teacher, students: self.example_students, book: self.example_book)
        print("number of students: \(example_class.numberOfStudents())")
        
        print("Teacher: \(example_teacher.name)")
        
    }
    
    
    func challengeThree() {
        
      let example_class = Class(teacher: self.example_teacher, students: self.example_students, book: self.example_book)
      example_class.AverageScoreOnAPage()
      example_class.reportOfStudent()
    
      print("Student Count: \(example_students.count)")
        
    }
    

    /// The Classroom class
    ///
    /// The object refers to a classroom. Every classroom has a id, teacher, students, and a book that the class is using.
    class Class {
        private(set) var id: UUID
        var teacher  : Teacher
        var students : [Student]
        var book : Book
        
        public init(teacher: Teacher, students: [Student], book: Book) {
            self.id = UUID()
            self.teacher = teacher
            self.students = students
            self.book = book
        }
        
        func numberOfStudents() -> Int {
            return self.students.count
        }
        
        /// print the average score from the class on a particulat page (sorted from highest to lowest)
        /// Assumption:  every student completed every page of the book and receive a score for each page
        func AverageScoreOnAPage() {
            print("printing the average score from the class on a particulat page (sorted from highest to lowest)")
            // A dictionary that matches the page ID to the sum score of the page
            var ScoreDict = [UUID: Double]()
            
            // go through every page of the students'a answer
            for student in self.students {
                for answer in student.answers {
                    // the page ID is present in the dictionary
                    if ScoreDict[answer.pageID] != nil {
                        ScoreDict[answer.pageID] = ScoreDict[answer.pageID]! + answer.score * 100
                    }else {
                        ScoreDict[answer.pageID] = answer.score * 100
                    }
                }
            }
            // sorting the dict using closure based on the score
            let sortedScore = ScoreDict.sorted(by: {
                $0.value > $1.value
            })
                
            // explore the sorted score dictionary
            for (id, score) in sortedScore {
                let average = score / Double(self.students.count)
                for page in book.pages {
                    if (page.id == id) {
                        print("\(page.title): \(String(format: "%.2f", average))%")
                        break
                    }
                }
            }
        }
        
        /// show individual student data across the entire book (sorted from highest to lowest)
        /// Assumption:  every student completed every page of the book and receive a score for each page
        func reportOfStudent() {
            print("showing individual student data across the entire book (sorted from highest to lowest)")
            var ReportDict = [String: Double]()
            
            // go through every student and sum up score of each page of each student
            for student in self.students {
                var sum : Double = 0
                for answer in student.answers {
                    sum = sum + (answer.score*100)
                }
                ReportDict[student.name] = sum
            }
            
            // sorting the report dict
            let sorted_report = ReportDict.sorted(by: {
                $0.value > $1.value
            })
            
            // explore the sorted report dictionary
            for (name, report) in sorted_report {
                // divide the total score by how many pages theere are in the book
                let score = report / Double(self.book.pages.count)
                print("\(name): \(String(format: "%.2f", score))%")
            }
        }
    }

    
    
}

/// Helper Functions
///
/// This is where we have written some helper functions to set up your enviornment for you
public extension TakeHome {
    
    /// Generates some example data to use when writing your code
    ///
    /// This function goes through each student and generates some random answers to each page of the the two books
    func generateFakeStudentData(_ type: Answer.ScoreType) {
        for student in self.example_students {
            for page in self.example_book.pages {
                student.enterAnswer(for: page, type: type)
            }
        }
    }
}

        
