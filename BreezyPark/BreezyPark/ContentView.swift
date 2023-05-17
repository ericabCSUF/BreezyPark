//
//  ContentView.swift
//  ParkBreezy
//
//  Page displays the address search prompt
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var imageSize: CGFloat = UIScreen.main.bounds.height/2
    @StateObject var viewModel: ContentViewMain
    @FocusState private var isFocusedTextField: Bool
        
    var body: some View {
        
            ZStack {
                VStack {
                    TextField("Enter Address", text: $viewModel.searchableText)
                        .frame(width: 250)
                        .padding(10)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .padding(5)
                        .autocorrectionDisabled()
                        .focused($isFocusedTextField)
                        .onReceive(
                            viewModel.$searchableText.debounce(
                                for: .seconds(1),
                                scheduler: DispatchQueue.main
                            )
                        ) {
                            viewModel.searchAddress($0)
                        }
                    List(self.viewModel.results) {address in
                        AddressRow(address: address)
                    }
    
                }
                
            }.background(
                Image("freeway")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewMain())
    }
}

