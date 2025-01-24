//
//  ProjectCardView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 22/01/25.
//

import SwiftUI

struct ProjectCardView: View {
    let project: Project
    @State private var isDonationSheetPresented = false
    @State private var showConfetti = false

    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ProjectImageView(project: project)

                // Adjusted InfoView with flexible spacing
                ProjectInfoView(project: project)

                ProgressViewSection(project: project)

                DonateButtonView(
                    isDonationSheetPresented: $isDonationSheetPresented,
                    showConfetti: $showConfetti,
                    project: project
                )
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .green, radius: 10, x: 0, y: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.green, lineWidth: 2)
            )
            .frame(width: 275, height: 540)

            // Confetti Overlay
            if showConfetti {
                ConfettiView()
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(2)
            }
        }
    }
}

struct ProjectCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCardView(project: Project(
            id: "1",
            name: "Mumbai Green Oasis Initiative",
            image: "green_oasis_initiative",
            description: ["Mumbai Green Oasis Initiative aims to reforest urban spaces in Mumbai to combat air pollution."],
            short_description: "Focuses on reforesting urban spaces in Mumbai to combat air pollution.",
            location: "Mumbai, India",
            funding_goal: 50000,
            funding_received: 20000
        )
        )
    }
}
