//
//  LeaderboardView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var viewModel: LeaderboardViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Check for Empty Data
                if viewModel.organizations.isEmpty {
                    Text("No data available")
                        .foregroundColor(.gray)
                        .font(.title3)
                } else {
                    // Top 3 Cards
                    VStack(spacing: 16) {
                        ForEach(Array(viewModel.organizations.prefix(3).enumerated()), id: \.element.id) { index, org in
                            LeaderboardCardView(
                                organization: org,
                                rank: index + 1
                            )
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)

                    // Full Leaderboard
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Full Leaderboard")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)

                        ForEach(Array(viewModel.organizations.dropFirst(3).enumerated()), id: \.element.id) { index, org in
                            LeaderboardRowView(
                                rank: index + 4,
                                organization: org
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            // Debug the Data
            print("Organizations Count: \(viewModel.organizations.count)")
            viewModel.organizations.forEach { org in
                print("Organization: \(org.name), CO2: \(org.co2Reduction)")
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = LeaderboardViewModel()
        return LeaderboardView()
            .environmentObject(mockViewModel)
    }
}
