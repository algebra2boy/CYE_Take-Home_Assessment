# CYE Take-Home Assessment Walkthrough

### Assessment Instructions and Set-Up Guide

---

Congratulations on making it this far in the hiring process! Our team is really excited about your passion and background and has created this assessment to now test your technical skills. It’s important to note that this assignment is not designed to stress you out! We have created it as a means of learning more about your coding style, thought process, and work-ethic. That being said, be true to you! Treat this as if it’s a day in the office, use what tools and softwares you might normally use (online or on-device) and if you are confused feel free to reach out and ask questions. 

This assignment is developed in Swift, a language you will become abundantly familiar with should you be hired for the position. Swift was designed for development on Apple’s core operating systems (iOS, iPadOS, macOS, tvOS and watchOS). As a result, a lot of Swift’s functionality is limited to macOS through an Integrated Development Environment (IDE) called Xcode. Luckily, in the past few years Swift’s popularity has grown quite large. Its core functionality has now been made open source and is available for Linux as well. For this assessment, we have tried to make it as accessible as possible for those who may not be able to install Xcode. If you feel you are unable to complete this challenge for a reason out of your control, contact us immediately and we will work to find a solution.

---

### 🚐  Prerequisite Instructions

For those with a MacBook, all you need to do is download Xcode in order to open this project. You can do so by visiting the app store on mac.

For those who **do not** own a MacBook. You will need to use linux to run the swift code on your machine. If you have a windows machine, you can install linux using a virtual machine, like VirtualBox. If you are using a linux machine already, you just need to install swift onto that machine. For either scenario, this guide [here](https://www.aya.io/blog/swift-5-in-vscode-in-linux-mint-in-virtualbox/) proved quite useful. If you are having trouble, google is your best friend. If you have exhausted all options, reach out to us and we can figure out an alternative solution.

---

### ⏳  Downloading the Assessment

To download the assessment, head to this Github repository here and download the code.

[https://github.com/CenterforYouthEngagement/TakeHome](https://github.com/CenterforYouthEngagement/TakeHome)

If you own a mac, all you need to do is navigate inside the `TakeHome/` folder and click on the `Package.swift` file.

If you are not using Xcode, you can open the file in whatever editor you prefer. (VSCode is a great one).

---

### 🤖  Brief Overview

```bash
app.swift
Data Models/
    - Book/
            - Book.swift
            - Page.swift
    - User
            - Student.swift
            - Teacher.swift
```

This assessment given to you is a glimpse of what it is like to walk in the shoes of a CYE developer. In the package, you will work with a book object, a student object, and a teacher object. In the assessment, a teacher has a property called students, which lists the students in his or her class. Students also have an array called answers. This array is of object type `Answer` and stores the page a student was on and the score he or she got for that page.

In the assessment package, we have also included a number of tests and documentation to help you when working on the challenges. Feel free to check these out and expand upon them should you wish! *Remember, pretend like its just another day at the office!*

---

### 🎃  Development

The main file for development is `app.swift.`Here you can access the terminal through the main function. Every time you run the application (whether through Xcode or through terminal) the `main` function will be run. Feel free to give it a try!

To run in Xcode, all you need to do is press the play button in the top left. If you are using terminal, first navigate to the proper directory. From there you can run the command:

```bash
swift run
```

To run the tests, you can run:

```bash
swift test
```

---

### 👻  Challenge #1

Your first task has come directly from one of the teachers in our beta test:

> “I am not sure how to assess how students did on their book. I can see that they have answers, but I’m not sure which page the answers belong to. Is this intended?” After talking with the manager, he alerts her that this feature does not currently exist yet. He tasks you with creating a view that shows how a student performed on the pages of the book in a readable manner.
> 

There is a model in the TakeHome called `Answer` . This model stores the ID of the page the student worked on, and the score the student received on that page. However, it does not store the contents of the page. For your task, you will print out the results of the first student (in the array) for all the pages he completed. We want the result to look something like this:

```
Student A:
Page 1: 50%
Page 2: 30%
Page 3: 80%
Page 4: 75%
...
```

You can style your table however you like, we mostly would like to see how well you are able to understand, navigate, and interact with the existing codebase in this assessment.

---

### 🥷🏼  Challenge #2

In your second challenge, we want to open things up a bit more in a scenario:

> The team has been demoing the beta version of the app to teachers for the last month. In that time, they have begun to notice that teachers often swap classes a lot. Due to unforeseen circumstances, teachers often have to sub in for other teachers, and this creates a problem in our app as students belong to specific teachers in code. Your manager has tasked you with creating a new `Class` (like a classroom, not the a Swift class) object that untangles the teacher and student objects. Additionally, this class object should store the book that the class is using, so that it can be referenced later.
> 

Your task is to create this model, create an `example_class` object, populate it with a teacher, book, and students. Additionally, you should remove any old code from the Teacher and Student models that is antiquated / outdated. To verify that you have successfully created this class object, print out some of the features of your `example_class`

---

### 📊  Challenge #3

For your final challenge, we are going to delve into the data of the students. As seen in the assessment, example data is created for you that mimics student answers to the different pages of their book. Now that we have our Class object, we want to add a method to this class so that the teacher of the class can retrieve information related to student performance.

Your task in this challenge is to create two algorithms that helps teachers glean student progress in the book. One algorithm will print all the average score from the class on a particular **page** (sorted from highest to lowest). Something like this:

```
Page 3: 90%
Page 1: 50%
Page 2: 45%
...
```

The second algorithm will show individual student data across the entire book (sorted from highest to lowest). Something like this:

```
Student B: 70%
Student A: 60%
Student C: 40%
...
```

---

### 🪴  Submission

We kindly ask that you complete your assessment by the end of next week (10/14). If you have any trouble meeting that deadline but are still committed to the position, feel free to reach out.

Once you have completed this challenge, we ask that you email it over to Sam DuBois at `sdubois@umass.edu`  (Please reply to the existing thread of emails). You can send it via an attachment or Github Repository link.

If you have any questions over the course of this assignment just reach out!

Thank you all and happy coding!

The CYE team
