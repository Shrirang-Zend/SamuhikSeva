//
//  ConfettiView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct ConfettiView: View {
    @State private var startAnimation: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Confetti from Bottom Leading
                ForEach(0..<20, id: \.self) { index in
                    ConfettiShape()
                        .frame(width: CGFloat.random(in: 8...14), height: CGFloat.random(in: 8...14))
                        .foregroundColor([.red, .blue, .green, .yellow, .orange, .purple].randomElement()!)
                        .position(
                            x: CGFloat.random(in: geometry.size.width * 0.1...geometry.size.width * 0.4),
                            y: startAnimation ? CGFloat.random(in: 0...geometry.size.height * 0.2) : geometry.size.height
                        )
                        .animation(
                            Animation.easeOut(duration: 0.8) // Blast up in 0.3 seconds
                                .delay(Double(index) * 0.02)
                                .repeatCount(1, autoreverses: false),
                            value: startAnimation
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation(
                                    Animation.easeIn(duration: 2) // Fall down in 0.8 seconds
                                        .delay(Double(index) * 0.02)
                                ) {
                                    startAnimation = false
                                }
                            }
                        }
                }

                // Confetti from Bottom Trailing
                ForEach(0..<20, id: \.self) { index in
                    ConfettiShape()
                        .frame(width: CGFloat.random(in: 8...14), height: CGFloat.random(in: 8...14))
                        .foregroundColor([.red, .blue, .green, .yellow, .orange, .purple].randomElement()!)
                        .position(
                            x: CGFloat.random(in: geometry.size.width * 0.6...geometry.size.width * 0.9),
                            y: startAnimation ? CGFloat.random(in: 0...geometry.size.height * 0.2) : geometry.size.height
                        )
                        .animation(
                            Animation.easeOut(duration: 0.8) // Blast up in 0.3 seconds
                                .delay(Double(index) * 0.02)
                                .repeatCount(1, autoreverses: false),
                            value: startAnimation
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation(
                                    Animation.easeIn(duration: 2) // Fall down in 0.8 seconds
                                        .delay(Double(index) * 0.02)
                                ) {
                                    startAnimation = false
                                }
                            }
                        }
                }
            }
            .onAppear {
                startAnimation = true // Trigger the animation when the view appears
            }
        }
    }
}

struct ConfettiShape: View {
    var body: some View {
        if Bool.random() {
            Circle() // Randomly chooses between shapes
        } else {
            RoundedRectangle(cornerRadius: CGFloat.random(in: 4...8))
        }
    }
}
