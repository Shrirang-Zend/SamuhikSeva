//
//  HomeContentView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct HomeContentView: View {
    @State private var selectedQuiz: String?
    @State private var isQuizSheetPresented: Bool = false
    @State private var isQuizDetailPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                PhotoOverlaySection()
                HorizontalCardsView()

                // Quiz Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Quiz")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        isQuizSheetPresented = true
                    }) {
                        Text("Test Your Knowledge!")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                VideoFrameSection()
                    .padding(.horizontal)
                Spacer()
            }
            .padding()
        }
        // Presenting QuizSelectionSheet
        .sheet(isPresented: $isQuizSheetPresented) {
            QuizSelectionSheet(isQuizDetailPresented: $isQuizDetailPresented)
                .environmentObject(QuizViewModel())
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
            .environmentObject(QuizViewModel())
    }
}
