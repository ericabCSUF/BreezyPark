//
//  MapView.swift
//  ParkBreezy
//
//  This shows the map view and allows
//  the user to click anywhere on the
//  page to open the information view
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewMain()
    private let address: AddressCheck
    init(address: AddressCheck) {
        self.address = address
    }
    @State private var showingSheet = false

    var body: some View {
        Map(
            coordinateRegion: $viewModel.region,
            annotationItems: viewModel.coordinates,
            annotationContent: { item in
                MapMarker(coordinate: item.coordinate)
            }
        )
        .onAppear {
            self.viewModel.getPlace(from: address)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            InfoPage(viewModel: viewModel)
        }
    }
}

