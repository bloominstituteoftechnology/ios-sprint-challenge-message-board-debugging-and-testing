//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    let thread = MessageThread(title: "Test")
    let message = MessageThread.Message(text: "TestMessage", sender: "TestPerson")
    
    let message1 = MessageThread.Message(text: "TestMessage1", sender: "TestPerson1", timestamp: NSDate().addingTimeInterval(60) as Date)
    let message2 = MessageThread.Message(text: "TestMessage2", sender: "TestPerson2", timestamp: NSDate() as Date)
    let message3 = MessageThread.Message(text: "TestMessage3", sender: "TestPerson3", timestamp: NSDate().addingTimeInterval(-60) as Date)
    
    
    
    
    //MessageThread Tests
    func testMessageThreadExists() {
        let thread = MessageThread(title: "Test")
        XCTAssertEqual(thread.title, "Test")
    }
    
    //Message Tests
    func testMessageExistsWithTestSender() {
        let message = MessageThread.Message(text: "TestMessage", sender: "TestSender")
        XCTAssertEqual(message.messageText, "TestMessage")
        XCTAssertEqual(message.sender, "TestSender")
    }
}



//func testSortsNotesByUpdatesDate() {
//    let firstNote = Note(name: "any name", content: "any content", lastUpdated: NSDate().dateByAddingTimeInterval(60))
//    let secondNote = Note(name: "any other name", content: "any content", lastUpdated: NSDate())
//    let thirdNote = Note(name: "yet another name", content: "any content", lastUpdated: NSDate().dateByAddingTimeInterval(-60))
//
//    let sut = NotesDataSource(notes: [thirdNote, firstNote, secondNote])
//
//    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)), isEqualTo: firstNote)
//    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)), isEqualTo: secondNote)
//    assert(sut.noteAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)), isEqualTo: thirdNote)
//}
//
//private func assert(note: Note, isEqualTo otherNote: Note) {
//    XCTAssertEqual(note.name, otherNote.name)
//}
//}



// DataTask was not resumed. Not sure if I can or should write a test for that.
// Two message threads in the instructions don't load?
// Nav Controller does not pop back to message table view.
