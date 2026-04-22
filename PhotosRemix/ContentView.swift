//
//  ContentView.swift
//  PhotosRemix
//
//  Created by Dani Muhammad on 20/04/26.
//

import SwiftUI

struct PhotoSection: Identifiable {
    let id = UUID()
    let date: String
    let filesCount: Int
    let photoCount: Int
    let hasStarOnFirst: Bool
}

struct ContentView: View {
    
//    @State private var usedGB: Double = 180
    
    let sections: [PhotoSection] = [
        PhotoSection(date: "January 2026", filesCount: 900, photoCount: 3, hasStarOnFirst: false),
        PhotoSection(date: "February 2026", filesCount: 900, photoCount: 3, hasStarOnFirst: false),
        PhotoSection(date: "March 2026", filesCount: 900, photoCount: 3, hasStarOnFirst: false),
        PhotoSection(date: "April 2026", filesCount: 900, photoCount: 3, hasStarOnFirst: false),
        PhotoSection(date: "Mei 2026", filesCount: 900, photoCount: 3, hasStarOnFirst: false),
    ]
    
//    let totalGB: Double = 251.32
//    var percent: Int { Int((usedGB / totalGB) * 100)}
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            // HEADER
            HStack {
                HStack(spacing: 0) {
                    Text("Swipe")
                }
                Spacer()
                Button {
                    print("filter tapped")
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundStyle(.black)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                Button {
                    print("trash tapped")
                } label: {
                    Text("Trash")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(.systemGray6))
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
//            HStack (alignment: .firstTextBaseline, spacing: 6) {
//                Text("\(percent)%")
//                    .font(.system(size: 37, weight: .bold))
//                    .foregroundStyle(.blue)
//                Text("used")
//                    .font(.title2)
//                Spacer()
//                Text(String(format: "%.2f GB used from %.2f GB", usedGB, totalGB))
//                    .font(.caption)
//                    .foregroundStyle(.secondary)
//            }
//            ProgressView(value: usedGB / totalGB)
//                .tint(.blue)
            
            // SCROLLABLE SECTIONS
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(sections) { section in
                        photoSectionView(section: section)
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func photoSectionView(section: PhotoSection) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Section header
            HStack {
                VStack(alignment: .leading) {
                    Text(section.date)
                        .font(.headline)
                    Text("\(section.filesCount) Files")
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .padding(4)
            }
            
            // Photo grid
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(0..<section.photoCount, id: \.self) { i in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            if i == 0 && section.hasStarOnFirst {
                                Image(systemName: "star.circle.fill")
                                    .foregroundStyle(.yellow)
                                    .font(.title3)
                                    .padding(4)
                            }
                        }
                }
            }
            
//            Button {}  label: {
//                Label("See More", systemImage: "chevron.right")
//                    .font(.subheadline)
//                    .foregroundStyle(.primary)
//                    .frame(maxWidth: .infinity)
//            }
//            .buttonStyle(.plain)
            
            Divider()
        }
    }
}

#Preview {
    ContentView()
}
