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
    var gender: Gender
    var height: Int
    var position: String
    var jerseyNumber: Int
    var club: String
//    var image: Data
//    var contactInfo: ContactInfo
//    var additionalContacts: [ContactInfo]
//    var gamesPlayed: [Game]
    
    // initializer
    init(
        firstName: String,
        lastName: String,
        dateOfBirth: Date = Date.now,
        gender: Gender = .male,
        height: Int = 0,
        position: String = "",
        jerseyNumber: Int = 0,
        club: String = ""
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.height = height
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.club = club
    }
}

// computed properties
extension Player {
    var reverseName: String {
        return lastName + ", " + firstName
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
}

enum Gender: Int, Codable, Identifiable, CaseIterable {
    case female, male
    
    var id: Self {
        self
    }
    
    var descr: String {
        switch self {
        case .male:
            "Male"
        case .female:
            "Female"
        }
    }
}

enum Relationship {
    case father, mother, sibling, player
}

// Contact information
//@Model
//class ContactInfo {
//    var primaryEmail: String
//    var secondaryEmail: String?
//    var cellPhone: String
//    var secondaryPhone: String?
//    var relationship: Relationship
//    
//    init(
//        primaryEmail: String,
//        secondaryEmail: String? = nil,
//        cellPhone: String,
//        secondaryPhone: String? = nil,
//        relationship: Relationship = .player
//    ) {
//        self.primaryEmail = primaryEmail
//        self.secondaryEmail = secondaryEmail
//        self.cellPhone = cellPhone
//        self.secondaryPhone = secondaryPhone
//        self.relationship = relationship
//    }
//}
