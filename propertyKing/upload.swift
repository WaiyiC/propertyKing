//
//  upload.swift
//  propertyKing
//
//  Created by Waiyi on 16/1/2024.
//

import SwiftUI

struct upload: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var imageArray = [UIImage()]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "photo")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                    
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                }
                .font(.largeTitle)
                .foregroundColor(.blue)
                
                VStack{
                    HStack{
                        
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    Image(systemName: "photo")
                                        .onTapGesture {
                                            isPresenting = true
                                            sourceType = .photoLibrary
                                        }
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                    }
                    HStack{
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                    }
                    
                    HStack{
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.1))
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                    }
                }
                
                
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        upload()
    }
}
