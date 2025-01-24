//
//  Organization.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import Foundation

// Top-Level Organization Model
struct Organization: Identifiable, Codable {
    let id: Int
    let name: String
    let co2Reduction: Int
    let treesPlanted: Int
    let waterSaved: Int
    let volunteersCount: Int
    let projects: [OrgProject]

    enum CodingKeys: String, CodingKey {
        case id, name
        case co2Reduction = "co2_reduction"
        case treesPlanted = "trees_planted"
        case waterSaved = "water_saved"
        case volunteersCount = "volunteers_count"
        case projects
    }
}

// Nested Project Model
struct OrgProject: Identifiable, Codable {
    let id: Int
    let projectName: String
    let co2Reduction: Int
    let treesPlanted: Int
    let waterSaved: Int
    let volunteers: [Volunteer]

    // Map JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case id
        case projectName = "project_name"
        case co2Reduction = "co2_reduction"
        case treesPlanted = "trees_planted"
        case waterSaved = "water_saved"
        case volunteers
    }
}

// Nested Volunteer Model
struct Volunteer: Codable {
    let name: String
    let role: String
}
