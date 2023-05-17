//
//  AddressRow.swift
//  ParkBreezy
//
//  After the user clicks on the address, they
//  will be directed to the map view
//

import Foundation
import SwiftUI

struct AddressRow: View {
    let address: AddressCheck
    
    var body: some View {
        NavigationLink {
            MapView(address: address)
        } label: {
            VStack(alignment: .leading) {
                Text(address.title)
                Text(address.subtitle)
                    .font(.caption)
            }
        }
        .padding(.bottom, 2)
    }
}

