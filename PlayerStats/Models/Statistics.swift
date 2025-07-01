//
//  Statistics.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import Foundation
import SwiftData

@Model
class Statistics {
    var goalsScored: Int
    var assists: Int
    var shots: Int
    var shotsOnGoal: Int
    var passesAttempted: Int
    var passesCompleted: Int
    
    init(
        goalsScored: Int = 0,
        assists: Int = 0,
        shots: Int = 0,
        shotsOnGoal: Int = 0,
        passesAttempted: Int = 0,
        passesCompleted: Int = 0
    ) {
        self.goalsScored = goalsScored
        self.assists = assists
        self.shots = shots
        self.shotsOnGoal = shotsOnGoal
        self.passesAttempted = passesAttempted
        self.passesCompleted = passesCompleted
    }
}
