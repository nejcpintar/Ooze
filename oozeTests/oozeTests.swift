//
//  oozeTests.swift
//  oozeTests
//
//  Created by Nejc on 5.1.2016.
//  Copyright © 2016 nejc. All rights reserved.
//

import XCTest
@testable import ooze

class oozeTests: XCTestCase {
    
    enum TestEvent : String, Event {
        case Event1 = "Event1"
        case Event2 = "Event2"
        case Event3 = "Event3"
        case Event4 = "Event4"
        
        var parameters : Dictionary<String, AnyObject> { return [String:AnyObject]() }
        var name : String { return self.rawValue }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var funnel = Funnel(steps: [TestEvent.Event1.rawValue, TestEvent.Event2.rawValue, TestEvent.Event3.rawValue]) {
            print("You did it!")
        }
        
        Ooze.sharedInstace.trackers.append(funnel)
        
        Ooze.sharedInstace.logEvent(TestEvent.Event1)
        Ooze.sharedInstace.logEvent(TestEvent.Event2)
        Ooze.sharedInstace.logEvent(TestEvent.Event3)
        
        XCTAssert(Ooze.sharedInstace.trackers.count == 0)
        
        funnel = Funnel(steps: [TestEvent.Event1.rawValue, TestEvent.Event2.rawValue, TestEvent.Event3.rawValue]) {
            print("You did it!")
        }
        
        Ooze.sharedInstace.trackers.append(funnel)
        Ooze.sharedInstace.logEvent(TestEvent.Event3)
        Ooze.sharedInstace.logEvent(TestEvent.Event1)
        Ooze.sharedInstace.logEvent(TestEvent.Event2)
        Ooze.sharedInstace.logEvent(TestEvent.Event2)
        Ooze.sharedInstace.logEvent(TestEvent.Event2)
        Ooze.sharedInstace.logEvent(TestEvent.Event1)
        Ooze.sharedInstace.logEvent(TestEvent.Event1)
        Ooze.sharedInstace.logEvent(TestEvent.Event1)
        Ooze.sharedInstace.logEvent(TestEvent.Event2)
        Ooze.sharedInstace.logEvent(TestEvent.Event3)
        
        XCTAssert(Ooze.sharedInstace.trackers.count == 0)
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
