//
//  LeaderboardViewModel.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import Foundation

class LeaderboardViewModel: ObservableObject {
    @Published var organizations: [Organization] = []

    init() {
        loadOrganizations()
    }

    private func loadOrganizations() {
        guard let url = Bundle.main.url(forResource: "orgs", withExtension: "json") else {
            print("JSON file not found in the bundle")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(OrganizationsWrapper.self, from: data)
            organizations = decodedData.organizations
            print("Organizations Loaded: \(organizations.count)")
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
}

struct OrganizationsWrapper: Codable {
    let organizations: [Organization]
}
