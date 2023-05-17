//
//  MainPage.swift
//  ParkBreezy
//
//  App landing page. This is the first page the user
//  sees when they open the page.
//

import Foundation
import SwiftUI

struct MainPage: View {

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Welcome to")
                        .padding(.top, 100)
                        .font(.system(size:56, weight:.semibold, design: .rounded))
                        .foregroundColor(.white)
                    Text("BreezyPark")
                        .padding(.top, -10)
                        .font(.system(size:56, weight:.semibold, design: .rounded))
                        .foregroundColor(.white)
                    Text("Click on the red car to begin")
                        .font(.system(size:20, design: .rounded))
                        .padding()
                    NavigationLink(destination:ContentView(viewModel: ContentViewMain())){
                                            Image("car")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width:150, height:150)
                    }.padding(.top, 290)
                }
            }.background(Image("city scaled")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 2000, height: 2200)
            .padding(.top, -500)
            .padding(.leading, -100))
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

