//
//  LeaderboardRowView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//


import SwiftUI

struct LeaderboardRowView: View {
    let rank: Int
    let organization: Organization

    var body: some View {
        HStack(spacing: 16) {
            // Rank Badge
            Text("\(rank)")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.green)
                .clipShape(Circle())

            // Organization Name and Stats
            VStack(alignment: .leading, spacing: 4) {
                Text(organization.name)
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.tail)

                HStack(spacing: 16) {
                    StatBadge(icon: "cloud.fill", text: "\(organization.co2Reduction) tons", color: .blue)
                    StatBadge(icon: "leaf.fill", text: "\(organization.treesPlanted)", color: .green)
                    StatBadge(icon: "drop.fill", text: "\(organization.waterSaved) liters", color: .cyan)
                }
            }

            Spacer() // Push content to the left
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct StatBadge: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(color)
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
