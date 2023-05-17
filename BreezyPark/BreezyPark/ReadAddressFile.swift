//
//  ReadAddressFile.swift
//  ParkBreezy
//
//  Created by csuftitan on 5/3/23.
//

import Foundation

class readAddress: ObservableObject {
    
    @Published var addressFile = [String]()
    
    init() { self.readFile(fileName: "AddressFile")}
    func readFile(fileName: String)
    {
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt")
        {
            do
            {
                let addressData = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                //print(addressData)
                addressFile = addressData.components(separatedBy: "*")
            }
            catch
            {
                print("Contents could not be loaded")
            }
            
        }
        else
        {
            print("fdkafhkfda")
        }
        //return self.fileData
    }
}

