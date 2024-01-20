//
//  upload.swift
//  propertyKing
//
//  Created by Waiyi on 16/1/2024.
//

import SwiftUI
import PhotosUI

struct upload: View {

    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedPhotosData: [Data] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(selection: $selectedItems, maxSelectionCount: 8, matching: .any(of: [.images, .not(.livePhotos)])) {
                    Image(systemName: "photo.badge.plus.fill")
                        .foregroundColor(.green)
                }
                .onChange(of: selectedItems) { newItems in
                    for newItem in newItems {

                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self) {
                                selectedPhotosData.append(data)
                            }
                        }

                    }
                }
               
                VStack{
                    HStack{
                        
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    
                                    }
                                )
                                }
                            
                       
                    }
                    
                    
                }
            }
            .padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        upload()
    }
}
