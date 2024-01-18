//
//  BiometricModel.swift
//  propertyKing
//
//  Created by Waiyi on 10/1/2024.
//


import Foundation
import LocalAuthentication

class BiometricModel : ObservableObject {
    let context = LAContext()
    
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var isAuthenicated = false
    
    func checkPolicy() {
        var error : NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                     error: &error) {
            self.isError = false
        } else {
            if let err = error {
                self.isError = true
                switch err.code {
                case LAError.Code.biometryNotEnrolled.rawValue:
                    self.errorMessage = "Please Enroll forst"
                case LAError.Code.passcodeNotSet.rawValue:
                    self.errorMessage = "Please set the passcode"
                case LAError.Code.biometryNotAvailable.rawValue:
                    self.errorMessage = "Not Available"
                default:
                    self.errorMessage = "Unknown Error"
                }
            }
        }
    }
    
    func evaluatePolicy() {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: "Authentication is required", reply: {
            success, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    self.isError = true
                    self.errorMessage = "Login Fail"
                } else {
                    self.isError = false
                    self.isAuthenicated = true
                    home()
                }
            }
        })
    }
}
