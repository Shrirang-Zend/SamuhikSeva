//
//  LeaderboardCardView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//
import SwiftUI

struct LeaderboardCardView: View {
    let organization: Organization
    let rank: Int

    var body: some View {
        VStack(spacing: 12) {
            // Rank and Medal
            HStack {
                Spacer()
                VStack {
                    Text("#\(rank)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(circleColor(for: rank))
                        .clipShape(Circle())
                }
                Spacer()
            }

            // Organization Name
            Text(organization.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)

            // Stats Section
            HStack(spacing: 16) {
                StatBadge(icon: "cloud.fill", text: "\(organization.co2Reduction) tons", color: .blue)
                StatBadge(icon: "leaf.fill", text: "\(organization.treesPlanted)", color: .green)
                StatBadge(icon: "drop.fill", text: "\(organization.waterSaved) liters", color: .cyan)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(gradientBackground(for: rank))
        .cornerRadius(16)
        .shadow(color: glowColor(for: rank).opacity(0.4), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(glowColor(for: rank), lineWidth: 2)
        )
    }

    // Gradient Background Based on Rank
    private func gradientBackground(for rank: Int) -> LinearGradient {
        switch rank {
        case 1:
            return LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.2), Color.yellow.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case 2:
            return LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case 3:
            return LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.2), Color.orange.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        default:
            return LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }

    // Circle Color for Rank Badge
    private func circleColor(for rank: Int) -> Color {
        switch rank {
        case 1: return .yellow
        case 2: return .gray
        case 3: return .orange
        default: return .blue
        }
    }

    // Glow Color Based on Rank
    private func glowColor(for rank: Int) -> Color {
        switch rank {
        case 1: return .yellow
        case 2: return .gray
        case 3: return .orange
        default: return .blue
        }
    }
}
