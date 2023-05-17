//
//  ReadParkingFile.swift
//  ParkBreezy
//
//  Reads the entire contents of ParkingFile.tx and creates an
//  array of strings that can be split to display the parking
//  information of the selected address

import Foundation
class readParking: ObservableObject {
    @Published var parkingFile = [String]()
    
    init() { self.readFile(fileName: "ParkingFile")}
    func readFile(fileName: String)
    {
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt")
        {
            do
            {
                let parkingData = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                print(parkingData)
                parkingFile = parkingData.components(separatedBy: "*")
            }
            catch
            {
                print("Data could not be read")
            }
        }
        else
        {
            print("Cannot load Parking File")
        }
        //return self.fileData
    }
}

