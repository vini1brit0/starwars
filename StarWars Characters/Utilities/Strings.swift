//
//  Strings.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import Foundation

struct Strings {
    
    // MARK: Error messages
    static let somethingWentWrong = "Something went wrong with your request."
    static let errorFetchingData = "Error fetching data from API: "
    static let noTitle = "No title available"
    static let noInternet = "No internet connection"
    static let couldNotCreateURL = "Could not create a URL from "
    static let noSuccessResponse = "Could not get a success response"
    static let noDecodedData = "Could not return decoded data"
    static let noWiFi = "wifi.slash"
    
    // MARK: URLs
    static let baseURL =  "https://swapi.dev/api/people"
    
    // MARK: Common
    static let emptyString = ""
    static let mainTitle = "Star Wars Characters"
    
    // MARK: Characteristics
    static let height = "Height: "
    static let mass = "Mass: "
    static let hairColor = "Hair Color: "
    static let skinColor = "Skin color: "
    static let eyeColor = "Eye color: "
    static let birthYear = "Birth year: "
    static let gender = "Gender: "
    
    // MARK: Network
    static let monitor = "Monitor"
}
