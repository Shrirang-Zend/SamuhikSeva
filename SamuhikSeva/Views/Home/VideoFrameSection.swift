//
//  VideoFrameSection.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct VideoFrameSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Featured Video")
                .font(.title2)
                .fontWeight(.bold)

            WebView(embedUrl: "https://www.youtube.com/embed/QysiRwibglg?si=NCCMGNW0K87SamyS")
                .frame(height: 200) // Adjust the height to fit your design
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct VideoFrameSection_Previews: PreviewProvider {
    static var previews: some View {
        VideoFrameSection()
    }
}
