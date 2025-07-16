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
            Player(firstName: "Clark", lastName: "Kent", dateOfBirth: tenYearsAgo, height: 167, position: "Striker", jerseyNumber: 5, club: "SCAA", isCaptain: true, gender: .male),
            Player(firstName: "Bruce", lastName: "Wayne", dateOfBirth: fourteenYearsAgo, height: 172, position: "Defender", jerseyNumber: 22, club: "Gotham FC", gender: .male),
            Player(firstName: "Barabara", lastName: "Gordon", dateOfBirth: seventeenTearsAgo, height: 157, position: "Goalie", jerseyNumber: 11, club: "Arlington Soccer", gender: .female),
            Player(firstName: "Tony", lastName: "Stark"),
            Player(firstName: "John", lastName: "Francis", dateOfBirth: fourteenYearsAgo, height: 172, position: "Striker", jerseyNumber: 13, club: "Arlington", gender: .male)
        ]
    }
}
