//
//  Player.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import Foundation
import SwiftData

@Model
class Player {
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var image: Data?
    var height: Int
    var position: String
    var jerseyNumber: Int?
    var club: String
//    var gamesPlayed: [Game]
    
    init(
        firstName: String,
        lastName: String,
        dateOfBirth: Date = Date.now,
        image: Data,
        height: Int = 0,
        position: String = "",
        jerseyNumber: Int,
        club: String = "",
//        gamesPlayed: [Game] = []
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.club = club
//        self.gamesPlayed = gamesPlayed
    }
}

// computed properties
extension Player {
    var reverseName: String {
        return lastName + ", " + firstName
    }
}
