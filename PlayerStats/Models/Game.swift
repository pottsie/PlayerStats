//
//  Game.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import Foundation
import SwiftData

@Model
class Game {
    var opponent: String
    var date: Date
    var ourScore: Int
    var opponentScore: Int
    var location: Location
    var statistics: Statistics
    
    init(
        opponent: String,
        date: Date,
        ourScore: Int,
        opponentScore: Int,
        location: Location,
        statistics: Statistics = Statistics()
    ) {
        self.opponent = opponent
        self.date = date
        self.ourScore = ourScore
        self.opponentScore = opponentScore
        self.location = location
        self.statistics = statistics
    }
}

enum Location: Codable, CaseIterable {
    case home, away
}
