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
    var height: String
    var position: String
    var jerseyNumber: String
    var club: String
    var isCaptain: Bool
    var gender: Gender
    
    @Attribute(.externalStorage)
    var image: Data?
//    var contactInfo: ContactInfo
//    var additionalContacts: [ContactInfo]
//    var games: [Game]
    
    // initializer
    init(
        firstName: String,
        lastName: String,
        dateOfBirth: Date = Date.now,
        height: String = "",
        position: String = "",
        jerseyNumber: String = "",
        club: String = "",
        isCaptain: Bool = false,
        gender: Gender = .male
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.club = club
        self.isCaptain = isCaptain
        self.gender = gender
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
    
    var displayDOB: String {
        return dateOfBirth.formatted(date: .abbreviated, time: .omitted)
    }
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
