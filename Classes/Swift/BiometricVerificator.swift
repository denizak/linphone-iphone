//
//  BiometricVerificator.swift
//  linphone
//
//  Created by Deni Zakya on 22.11.23.
//

import Foundation
import LocalAuthentication

@objcMembers
final class BiometricVerificator: NSObject {
    func verifyBiometric(result: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                result(success)
                print("evaluate policy error => \(authenticationError.debugDescription)")
            }
        } else {
            result(false)
        }

        print("\(error.debugDescription)")
    }
}
