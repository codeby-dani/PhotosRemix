//
//  DuplicatePhotosView.swift
//  PhotosRemix
//
//  Created by Dani Muhammad on 22/04/26.
//

import SwiftUI

struct DuplicatePhotosView: View {
    
    @Binding var showDuplicates: Bool
    @State private var selectedFilter: String = "Duplicates"
    @State private var groups: [DuplicateGroup] = [
        DuplicateGroup(count: 5, photoCount: 3, selectedIndices: []),
        DuplicateGroup(count: 2, photoCount: 5, selectedIndices: []),
        DuplicateGroup(count: 7, photoCount: 2, selectedIndices: []),
        DuplicateGroup(count: 3, photoCount: 7, selectedIndices: []),
        DuplicateGroup(count: 11, photoCount: 11, selectedIndices: []),
    ]
    
    var totalSelected: Int {
        groups.reduce(0) { $0 + $1.selectedIndices.count }
    }
    
    var totalPhotos: Int {
        groups.reduce(0) { $0 + $1.photoCount }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(totalSelected) of \(totalPhotos) selected")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 8)
                
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundStyle(.blue)
                    Text("Showing: Duplicate Photos only")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach($groups) { $group in
                            duplicateGroupView(group: $group)
                        }
                    }
                    .padding(.vertical, 12)
                }
        }
    }

    // ← func ada di LUAR var body, tapi masih di dalam struct
    func duplicateGroupView(group: Binding<DuplicateGroup>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(group.wrappedValue.count) Duplicates")
                    .font(.headline)
                    .bold()
                Spacer()
                Text("Select All")
                    .font(.subheadline)
                Circle()
                    .stroke(Color.gray, lineWidth: 1.5)
                    .frame(width: 22, height: 22)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(0..<group.wrappedValue.photoCount, id: \.self) { i in
                        ZStack(alignment: .topTrailing) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 120, height: 120)
                            
                            if i == 0 {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Image(systemName: "rosette")
                                            .font(.caption2)
                                        Text("Best Photo")
                                            .font(.caption2)
                                            .fontWeight(.medium)
                                    }
                                    .foregroundStyle(.blue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                                    .padding(6)
                                }
                                .frame(width: 120, height: 120)
                            }
                            
                            Button {
                                if group.wrappedValue.selectedIndices.contains(i) {
                                    group.selectedIndices.wrappedValue.remove(i)
                                } else {
                                    group.selectedIndices.wrappedValue.insert(i)
                                }
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(group.wrappedValue.selectedIndices.contains(i)
                                              ? Color.blue : Color.black.opacity(0.3))
                                        .frame(width: 24, height: 24)
                                    
                                    if group.wrappedValue.selectedIndices.contains(i) {
                                        Image(systemName: "checkmark")
                                            .font(.caption2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                    } else {
                                        Circle()
                                            .stroke(.white, lineWidth: 1.5)
                                            .frame(width: 22, height: 22)
                                    }
                                }
                            }
                            .padding(6)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    DuplicatePhotosView(showDuplicates: .constant(true))
}
