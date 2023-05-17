//
//  AdditionalInfo.swift
//  ParkBreezy
//
//
//

import Foundation
import SwiftUI

class UserInformation: ObservableObject {
    @Published var userInfo: String

    init(userInfo: String){
        self.userInfo = userInfo
    }
}

