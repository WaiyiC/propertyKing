//
//  upload.swift
//  propertyKing
//
//  Created by Waiyi on 16/1/2024.
//

import SwiftUI
import PhotosUI
import CoreData
import FirebaseStorage
import Firebase

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
    @State private var showPhoto = false
    
    
    @State var data: Data?
    let storageRef = Storage.storage().reference().child("images/\(UUID().uuidString).jpg")
    
    var today = Date() // gets the current date & time
    
    var body: some View {
        NavigationStack{VStack{
            
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
                        dataManager.house.removeAll()
                        dataManager.listener()
                        //
                    }else{
                        showAlert = true
                    }
                   
                    
                }, label: {
                    Text("Save")
                })
                //                .fullScreenCover(isPresented: $showPhoto){
                //                    NavigationStack{
                //                        addPhoto(showPhoto: .constant(true))
                //                    }
                //                }
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
#Preview {
    upload( showPopup: .constant(true))
}
