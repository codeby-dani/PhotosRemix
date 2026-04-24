//
//  TrashView.swift
//  PhotosRemix
//
//  Created by Shinta Dewi Pramesti on 22/04/26.
//

import SwiftUI
<<<<<<< Updated upstream

struct PhotoItem: Identifiable {
    let id = UUID()
    let imageName: String
}

struct TrashView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var photos: [PhotoItem] = (1...20).map { PhotoItem(imageName: "foto_\($0)") }
    @State private var selectedPhotoIDs = Set<UUID>()
    @State private var showingDeleteAlert = false
    
    let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(photos) { photo in
                            PhotoGridCell(
                                photo: photo,
                                isSelected: selectedPhotoIDs.contains(photo.id),
                                onToggle: { toggleSelection(for: photo.id) }
                            )
                        }
                    }
                    .padding(.bottom, 120)
                }
                
                deleteButton
            }
            .navigationTitle("Trash")
            .navigationSubtitle("\(photos.count) Photos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Restore") {
                        restoreSelected()
                    }
                    .font(.system(size: 15, weight: .medium))
                    .padding(.horizontal, 0)
                    .padding(.vertical, 6)
                    .disabled(selectedPhotoIDs.isEmpty)
                }
            }
            .alert("Are you sure?", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive) { deletePermanently() }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("This action cannot be undone.")
            }
        }
    }
    
    
    private var deleteButton: some View {
        Button(action: { showingDeleteAlert = true }) {
            Text("Delete Permanently")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedPhotoIDs.isEmpty ? Color.gray : Color.red)
                .cornerRadius(15)
        }
        .disabled(selectedPhotoIDs.isEmpty)
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
    
    private func toggleSelection(for id: UUID) {
        if selectedPhotoIDs.contains(id) {
            selectedPhotoIDs.remove(id)
        } else {
            selectedPhotoIDs.insert(id)
        }
    }
    
    private func deletePermanently() {
        withAnimation(.easeInOut) {
            photos.removeAll { selectedPhotoIDs.contains($0.id) }
            selectedPhotoIDs.removeAll()
        }
    }
    
    private func restoreSelected() {
        withAnimation { selectedPhotoIDs.removeAll() }
    }
}

struct PhotoGridCell: View {
    let photo: PhotoItem
    let isSelected: Bool
    let onToggle: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(photo.imageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 120)
                .clipped()
                .onTapGesture { onToggle() }
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
                    .background(Circle().fill(.white))
                    .padding(8)
            } else {
                Circle().strokeBorder(.white, lineWidth: 2).frame(width: 24, height: 24).padding(8)
            }
        }
    }
}

#Preview {
    TrashView()
}
=======
struct TrashView: View {
    var body: some View {
       
        VStack {
            Image(systemName: "trash")
                .font(.largeTitle)
            Text("Trash is empty")
        }
    }
}
    
    #Preview {
        TrashView()
    }
>>>>>>> Stashed changes
