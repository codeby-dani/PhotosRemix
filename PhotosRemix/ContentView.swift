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

struct DuplicateGroup: Identifiable {
    let id = UUID()
    let count: Int
    let photoCount: Int
    var selectedIndices: Set<Int>
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
    
    @State private var selectedFilter: String = "All"
    @State private var showDuplicates = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showDuplicates {
                    DuplicatePhotosView(showDuplicates: $showDuplicates)
                        .padding(.top, 140)
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(sections) { section in
                                photoSectionView(section: section)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 140)
                    }
                }
            }
            .animation(.easeInOut(duration: 0.3), value: showDuplicates)
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top) {
                AppHeaderView(
                    selectedFilter: $selectedFilter,
                    showDuplicates: $showDuplicates
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
    func photoSectionView(section: PhotoSection) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Section header
            NavigationLink(destination: SectionDetailView(section: section)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(section.date)
                            .font(.headline)
                            .foregroundStyle(.black)
                        Text("\(section.filesCount) Files")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .padding(4)
                        .foregroundStyle(.black)
                }
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
