//
//  Funnel.swift
//  ooze
//
//  Created by Nejc on 5.1.2016.
//  Copyright © 2016 nejc. All rights reserved.
//

import Foundation

class Funnel : Tracker {
    private var steps : [String]
    private var completion : () -> ()
    var completed : Bool {
        return steps.count <= 0
    }
    
    init(steps: [String], completion: () -> ()) {
        self.steps = steps
        self.completion = completion
    }
    
    @objc func logEvent(event: Event) {
        guard let currentStep = steps.first else {
            return
        }
        
        if currentStep == event.name {
            steps.removeAtIndex(0)
        }
        
        if steps.count <= 0 {
            funnelCompleted()
        }
    }
    
    private func funnelCompleted() {
        Ooze.sharedInstace.removeTracker(self)
        completion()
    }
}