//
//  Ooze.swift
//  ooze
//
//  Created by Nejc on 5.1.2016.
//  Copyright © 2016 nejc. All rights reserved.
//

import Foundation

@objc protocol Event {
    var name : String { get }
    var parameters : Dictionary<String, AnyObject> { get }
}

@objc protocol Tracker : class {
    func logEvent(event: Event)
}

@objc class Ooze : NSObject {
    static let sharedInstace = Ooze()
    var trackers: [Tracker] = []
    func logEvent(event: Event) {
        trackers.forEach { $0.logEvent(event) }
    }
    
    func removeTracker(tracker: Tracker) -> Bool {
        guard let index = trackers.indexOf({ $0 === tracker }) else {
            return false
        }
        trackers.removeAtIndex(index)
        return true
    }
}