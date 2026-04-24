//
//  SectionDetailView.swift
//  PhotosRemix
//
//  Created by Dani Muhammad on 22/04/26.
//

import SwiftUI

struct SectionDetailView: View {
    let section: PhotoSection
    
    @State private var trashCount = 10
    @State private var currentIndex = 1
    
    var body: some View {
        VStack(spacing: 0) {
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 6) {
                Image(systemName: "trash")
                    .font(.caption)
                Text("\(trashCount) in Trash")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .foregroundStyle(.red)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.red.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 20)
            
            HStack(spacing: 40) {
                Button {
                    print("undo tapped")
                } label: {
                    Image(systemName: "arrowshape.turn.up.left")
                        .font(.title2)
                        .foregroundStyle(.primary)
                        .padding(20)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                
                Button {
                    trashCount += 1
                    print("trash tapped")
                } label: {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundStyle(.red)
                        .padding(20)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                
                Button {
                    print("keep tapped")
                } label: {
                    Image(systemName: "checkmark")
                        .font(.title2)
                        .foregroundStyle(.green)
                        .padding(20)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            .padding(.vertical, 24)
        }
        .navigationTitle(section.date)
        .navigationSubtitle("\(currentIndex)/\(section.filesCount)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SectionDetailView(section: PhotoSection(date: "January 2026", filesCount: 973, photoCount: 3, hasStarOnFirst: false))
}
