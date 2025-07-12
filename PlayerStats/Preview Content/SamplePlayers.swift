//
//  SamplePlayers.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/2/25.
//

import SwiftUI

extension Player {
    static let tenYearsAgo = Calendar.current.date(byAdding: .year, value: -10, to: Date.now)!
    static let fourteenYearsAgo = Calendar.current.date(byAdding: .year, value: -14, to: Date.now)!
    static let seventeenTearsAgo = Calendar.current.date(byAdding: .year, value: -17, to: Date.now)!

    static var samplePlayers: [Player] {
        [
            Player(firstName: "Clark", lastName: "Kent", dateOfBirth: tenYearsAgo, gender: .male, height: 167, position: "Striker", jerseyNumber: 5, club: "SCAA"),
            Player(firstName: "Bruce", lastName: "Wayne", dateOfBirth: fourteenYearsAgo, gender: .male, height: 172, position: "Defender", jerseyNumber: 22, club: "Gotham FC"),
            Player(firstName: "Barabara", lastName: "Gordon", dateOfBirth: seventeenTearsAgo, gender: .female, height: 157, position: "Goalie", jerseyNumber: 11, club: "Arlington Soccer"),
            Player(firstName: "Tony", lastName: "Stark"),
            Player(firstName: "John", lastName: "Francis", dateOfBirth: fourteenYearsAgo, gender: .male, height: 172, position: "Striker", jerseyNumber: 13, club: "Arlington")
        ]
    }
}
