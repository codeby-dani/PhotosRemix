//
//  AppHeaderView.swift
//  PhotosRemix
//
//  Created by Dani Muhammad on 23/04/26.
//

import SwiftUI

struct AppHeaderView: View {
    
    @Binding var selectedFilter: String
    @Binding var showDuplicates: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text("Swipe").foregroundStyle(.blue)
                    Text("Sort").foregroundStyle(.black)
                }
                .font(.largeTitle)
                .bold()
            }
            
            Spacer()
            
            Menu {
                Text("Sort By")
                    .font(.footnote)
                Button("Newest") { selectedFilter = "All" }
                Button("Oldest") { selectedFilter = "Date" }
                Divider()
                Menu {
                    Button { selectedFilter = "All"
                        showDuplicates = false} label: {
                            Label("All Items", systemImage: "square.grid.3x3")
                        }
                    Button {
                        selectedFilter = "Duplicates"
                        showDuplicates = true
                    } label: {
                        Label("Duplicates", systemImage: "square.on.square")
                    }
                    Button {
                        selectedFilter = "Monthly"
                    } label: {
                        Label("Monthly", systemImage: "calendar")
                    }
                } label: { Text("Filter") }
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.title2)
                    .padding(16)
                    .glassEffect(in: Circle())
                    .foregroundStyle(.black)
            }
            
            Button {
                print("trash tapped")
            } label: {
                Text("Trash")
                    .foregroundStyle(.red)
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .glassEffect(in: Capsule())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(.white)
    }
}
