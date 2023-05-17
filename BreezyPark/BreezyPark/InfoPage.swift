//
//  InfoPage.swift
//  ParkBreezy
//
//  Page is displayed as a pull up screen that gives
//  the parking information to the user after they click
//  on the map screen
//

import Foundation
import SwiftUI
import MapKit

struct InfoPage: View {
    @StateObject var viewModel = MapViewMain()
    @StateObject var info = UserInformation(userInfo: "")
    @ObservedObject var parkingData = readParking()
    @ObservedObject var addressData = readAddress()
    
    @State var fileAddress = ""
    @State var fileAddress2 = ""
    @State var fileAddress3 = ""
    @State var addressArray = ""
    @State var parking = ""
    let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    func getfile() -> some View {
        let parking: String = parkingData.parkingFile[0]
        return Text("\(parking)")
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .presentationDetents(Set(heights))
    }
    func getfile2() -> some View {
        let parking: String = parkingData.parkingFile[2]
        return Text("\(parking)")
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .presentationDetents(Set(heights))
    }
    func getfile3() -> some View {
        let parking: String = parkingData.parkingFile[1]
        return Text("\(parking)")
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .presentationDetents(Set(heights))
    }
    func getfile4() -> some View {
        let parking: String = parkingData.parkingFile[3]
        return Text("\(parking)")
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .presentationDetents(Set(heights))
    }
    
    var body: some View {
        let addressFromMap = viewModel.s
        let fileAddress: String = addressData.addressFile[0]
        let fileAddress2: String = addressData.addressFile[1]
        let fileAddress3: String = addressData.addressFile[2]

        NavigationView {
            ZStack{
                VStack {
                    VStack{
                        Text("Address:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -50)
                            .padding(.leading, 20)
                            .opacity(1.0)
                        Text("\(addressFromMap)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 50)
                    }
                    .frame(width: 360, height: 180)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    VStack {
                        Text("Parking Regulations:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        if(addressFromMap == fileAddress){
                            //home()
                            getfile()
                        }
                        else if(addressFromMap == fileAddress2)
                        {
                            getfile2()
                        }
                        else if(addressFromMap == fileAddress3)
                        {
                            getfile3()
                        }
                        else
                        {
                            getfile4()
                        }
                    }.frame(width: 360, height: 180)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                    VStack {
                        Text("Notes:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -50)
                            .padding(.leading, 20)
                        Text("\(info.userInfo)")
                    }.frame(width: 360, height: 180)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                }
                NavigationLink(destination: AddInfoPage(info: self.info)){
                                Text("Click to add information")
                                    .frame(width: 250, height: 40)
                                    .background(Color.white.opacity(0.9))
                            }.padding(.top, 650)
            }.background(
                Image("pxcity"))
       }.navigationBarHidden(false)
            .navigationViewStyle(.stack)
    }
}
struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage(info: UserInformation(userInfo: ""), parkingData: readParking(), addressData: readAddress())
    }
}

