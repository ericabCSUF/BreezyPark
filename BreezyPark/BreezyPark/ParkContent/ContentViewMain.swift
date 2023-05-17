//
//  ContentViewMain.swift
//  ParkBreezy
//
//
//

import Foundation
import MapKit

class ContentViewMain: NSObject, ObservableObject {
    @Published private(set) var results: Array<AddressCheck> = []
    @Published var searchableText = ""
    
    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.delegate = self
        return completer
    }()
    
    func searchAddress(_ searchableText: String) {
        guard searchableText.isEmpty == false else { return }
        localSearchCompleter.queryFragment = searchableText
    }
    
}
extension ContentViewMain: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task { @MainActor in
            results = completer.results.map {
                AddressCheck(title: $0.title, subtitle: $0.subtitle)
            }
        }
    }
        
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error)
    }
}


