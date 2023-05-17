//
//  AddInfoPage.swift
//  ParkBreezy
//
//
//

import Foundation
import SwiftUI


struct AddInfoPage: View {
    @ObservedObject var info: UserInformation

    var body: some View {
        ZStack{
        VStack{
            Text("""
            Add any important
            impormation below
            """)
            .padding(.leading)
            .padding(.top, -150)
            .padding(.bottom)
            .font(.largeTitle)
            Text("""
            This can include construction
            closures or temporary events
            that may limit parking
            availability
            """)
            .padding(.bottom, 50)
            TextField("Enter text here ", text: self.$info.userInfo, axis: .vertical)
                .padding(.top, 40)
                .padding(.leading, 40)
                .padding(.trailing, 40)
                .fixedSize(horizontal: false, vertical: true)
                .textFieldStyle(.roundedBorder)
        }
        }.background(Image("ombre"))
    }
}
struct AddInfoPage_Previews: PreviewProvider {
    
    static var previews: some View {
        AddInfoPage(info: UserInformation(userInfo: ""))
    }
}

