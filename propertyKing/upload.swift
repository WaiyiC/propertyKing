//
//  upload.swift
//  propertyKing
//
//  Created by Waiyi on 16/1/2024.
//

import SwiftUI
import PhotosUI
import CoreData


struct upload: View {
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
    
    @State var hsetype : String = ""
    @State var sell : String = ""
    @State var easte : String = ""
    @State var area : String = ""
    @State var price : String = ""
    
    let House = ["House", "Apartment"]
    @State private var selectedhouse = 0
    
    let selling = ["For sell", "For rent"]
    @State private var selectedSell = 0
    
    let Area = ["HONG KONG", "KOWLOON", "NEW TERRITORIES"]
    @State private var selectedarea = 0
    
    @Binding var showPopup : Bool
    
    var today = Date() // gets the current date & time

    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(selection: $selectedItems, maxSelectionCount: 8, matching: .any(of: [.images, .not(.livePhotos)])) {
                    Image(systemName: "photo.badge.plus.fill")
                        .foregroundColor(.green)
                        .font(.largeTitle)
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
                VStack {
                    Text("Edit details")
                    List {
                        Section() {
                            VStack {
                                Picker("House type", selection: $selectedhouse) {
                                    Text(House[0]).tag(0)
                                    Text(House[1]).tag(1)
                                }
                                
                                Picker("Selling type", selection: $selectedSell){
                                    Text(selling[0]).tag(0)
                                    Text(selling[1]).tag(1)
                                }
                                Picker("Area", selection: $selectedarea){
                                    Text(Area[0]).tag(0)
                                    Text(Area[1]).tag(1)
                                    Text(Area[2]).tag(2)
                                }
                                
                                HStack{
                                    Text("District")
                                    TextField("District", text:$easte)
                                        .font(.system(size: 20))
                                        .frame(height: 30)
                                        .multilineTextAlignment(.trailing)
                                }
                                HStack{
                                    Text("Price")
                                    TextField("Price", text: $price)
                                        .multilineTextAlignment(.trailing)
                                        .keyboardType(.numberPad)
                                }
                            }
                            
                        }
                    }
                    .frame(width: 450)
                    .scrollContentBackground(.hidden)
                }
                HStack {
                    Button(action: {
                        if price != "" && easte != "" {
                            dataManager.addNew(hsetype: House[selectedhouse],
                                               sell: selling[selectedSell],
                                               area: Area[selectedarea],
                                               easte: easte,
                                               price: price,
                                               time: Date())
                            
                            showPopup = false
                        }else{
                            showAlert = true
                        }
                    }, label: {
                        Text("Save")
                    })
                    
                    .alert("Please Input Price and Easte", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Button(action: {
                            showPopup = false
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
        
    }
    
    
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
}
#Preview {
    upload(showPopup: .constant(false))
}
