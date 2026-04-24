//
//  SwipeView.swift
//  PhotosRemix
//
//  Created by Shinta Dewi Pramesti on 22/04/26.
//

import SwiftUI
struct SwipeView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "trash")
                .font(.largeTitle)
            Text("Trash is empty")
        }
    }
}

#Preview {
    SwipeView()
}
