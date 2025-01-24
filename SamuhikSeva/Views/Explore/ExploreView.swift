//
//  ExploreView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 22/01/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var projects: [Project] = []
    @State private var topCardIndex = 0
    @State private var dragOffset: CGSize = .zero

    var body: some View {
        ZStack(alignment: .center) { // Ensure alignment is centered
            // Card Stack
            ForEach((0..<projects.count).reversed(), id: \.self) { index in
                if index >= topCardIndex {
                    ProjectCardView(project: projects[index])
                        .zIndex(Double(projects.count - index)) // Stacking order
                        .offset(
                            x: index == topCardIndex ? dragOffset.width : 0,
                            y: CGFloat(index - topCardIndex) * 10 + (index == topCardIndex ? dragOffset.height : 0)
                        )
                        .scaleEffect(index == topCardIndex ? 1.0 : 0.95) // Top card larger
                        .rotationEffect(.degrees(index == topCardIndex ? 0 : Double(index - topCardIndex) * 2)) // Slight rotation
                        .gesture(
                            index == topCardIndex ?
                                DragGesture()
                                    .onChanged { value in
                                        dragOffset = value.translation
                                    }
                                    .onEnded { value in
                                        handleDragEnd(value.translation)
                                    }
                                : nil
                        )
                        .animation(.easeInOut, value: dragOffset)
                }
            }

            // Empty State
            if topCardIndex >= projects.count {
                Text("No more projects!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            loadProjects()
        }
        .navigationBarHidden(true) // Hide navigation bar
        .navigationBarBackButtonHidden(true) // Hide back button
    }

    private func handleDragEnd(_ translation: CGSize) {
        if abs(translation.width) > 100 { // Swipe threshold
            withAnimation {
                dragOffset = .zero
                topCardIndex += 1 // Move to the next card
            }
        } else {
            withAnimation {
                dragOffset = .zero
            }
        }
    }

    private func loadProjects() {
        if let url = Bundle.main.url(forResource: "projects", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
                projects = decodedProjects
            } catch {
                print("Error loading projects: \(error)")
            }
        } else {
            print("JSON file not found!")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
