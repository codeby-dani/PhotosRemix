//
//  ContentView.swift
//  PhotosRemix
//
//  Created by Dani Muhammad on 20/04/26.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var usedGB: Double = 71
    
    let totalGB: Double = 251.32
    
//    var percent: Int { Int((usedGB / totalGB) * 100)}
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Remix")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Button {
                    print("filter tapped")
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundStyle(.primary)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            
            
            HStack (alignment: .firstTextBaseline, spacing: 6) {
                Text("\(percent)%")
                    .font(.system(size: 37, weight: .bold))
                    .foregroundStyle(.blue)
                Text("used")
                    .font(.title2)
                Spacer()
                Text(String(format: "%.2f GB used from %.2f GB", usedGB, totalGB))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            ProgressView(value: usedGB / totalGB)
                .tint(.blue)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("11 Feb 2026")
                        .font(.headline)
                    Spacer()
                    Text("Select All")
                        .font(.subheadline)
                    Circle()
                        .stroke(Color.gray, lineWidth: 1.5)
                        .frame(width: 22, height: 22)
                }
                
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(0..<3) { i in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.3))
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(alignment: .topTrailing) {
                                if i == 0 {
                                    Image(systemName: "star.circle.fill")
                                        .foregroundColor(.yellow)
                                        .font(.title3)
                                        .padding(4)
                                }
                            }
                    }
                }
                
                Button { } label: {
                    Label("See More", systemImage: "chevron.right")
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 20)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
}


#Preview {
    ContentView()
}
