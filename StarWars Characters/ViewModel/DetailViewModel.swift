//
//  DetailViewModel.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published private(set) var characters: Characters?
    @Published var isLoading = false
    
    init() {}
    
    func fetchCharacter(url: String) async {
        self.isLoading = true
        do {
            guard let url = URL(string: url) else {
                print(Strings.couldNotCreateURL + url)
                self.isLoading = false
                return
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print(Strings.noSuccessResponse)
                self.isLoading = false
                return
            }
            
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(Characters.self, from: data) else {
                print(Strings.noDecodedData)
                return
            }
            
            DispatchQueue.main.async {
                self.characters = decodedData
                self.isLoading = false
            }
        } catch {
            self.isLoading = false
            print("\(Strings.errorFetchingData): \(error)")
        }
    }
}
