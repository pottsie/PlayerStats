//
//  Enums.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/6/25.
//

import Foundation

enum SortOrder: String, Identifiable, CaseIterable {
    case last, first, number
    
    var title: String {
        switch self {
        case .last:
            return "Last name"
        case .first:
            return "First name"
        case .number:
            return "Jersey number"
        }
    }
    
    var id: Self {
        self
    }
}

enum Gender: Int, Codable, Identifiable, CaseIterable {
    case female, male
    
    var id: Self {
        self
    }
    
    var dscr: String {
        switch self {
        case .female:
            "Female"
        case .male:
            "Male"
        }
    }
}

enum ValidationResult {
    case success
    case failed(String)
    
    var errorMessage: String? {
        switch self {
        case .success:
            return nil
        case .failed(let msg):
            return msg
        }
    }
}

enum Relationship {
    case father, mother, sibling, player
}

