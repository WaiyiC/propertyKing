//
//  addPhoto.swift
//  propertyKing
//
//  Created by Waiyi on 29/1/2024.
//

import SwiftUI
import PhotosUI
import CoreData
import FirebaseStorage
import Firebase

struct addPhoto: View {
    @EnvironmentObject var dataManager : DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \HouseInfo.timestamp, ascending: true)],
        animation: .default)
    private var houseInfo: FetchedResults<HouseInfo>
    
    @State private var showAlert = false
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedPhotosData: [Data] = []
    
    var currentUploadTask: StorageUploadTask?
    
    @Binding var showPhoto : Bool
    
    @State var data: Data?
    
    var body: some View {
        
        PhotosPicker(selection: $selectedItems, maxSelectionCount: 8, matching: .any(of: [.images, .not(.livePhotos)])) {
            if let data = data, let image = UIImage(data: data) {
                Image(systemName: "photo.badge.plus.fill")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }else {
                Image(systemName: "photo.badge.plus.fill")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
        }
        .onChange(of: selectedItems) { newItems in
            for newItem in newItems {
                Task {
                    if let data = try? await newItem.loadTransferable(type: Data.self) {
                        selectedPhotosData.append(data)
                    }
                }
            }
                
            guard let item = selectedItems.first else {
                return
            }
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        self.data = data
                    }
                case .failure(let failure):
                    print("Error: \(failure.localizedDescription)")
                }
                
            }
        }
        Rectangle()
            .strokeBorder()
            .foregroundColor(.green.opacity(0))
            .frame(width: 350, height: 200)
            .overlay(
                ScrollView(.horizontal) {
                    Group {
                        HStack {
                            ForEach(selectedPhotosData, id: \.self) {
                                photoData in
                                if let image = UIImage(data: photoData) {
                                    Rectangle()
                                        .strokeBorder()
                                        .foregroundColor(.green.opacity(0))
                                        .frame(width: 200, height: 200)
                                        .overlay(
                                            Image(uiImage: image)
                                                .resizable()
                                                .padding(.horizontal)
                                        )
                                }
                            }
                        }
                    }
                }
            )
        HStack {
            Button(action: {
                
                showPhoto = true
                let ref = Firestore.firestore().collection("house").document().documentID
                let path = "\(UUID().uuidString).jpg"
                let fileRef = Storage.storage().reference().child(path)
                fileRef.putData(data!, metadata: nil) { (metadata, error) in
                    guard let metadata = metadata else {
                        return
                    }
                    print("Success",ref)
                    dataManager.house.removeAll()
                    dataManager.listener()
                }}, label: {
                    Text("Save")
                })
        }
            .disabled(data == nil)
            
            Button(action: {
                showPhoto = false
            }, label: {
                Text("Cancel")
            })
            .padding(.horizontal)
        }
    }


#Preview {
    addPhoto(showPhoto: .constant(true))
}
