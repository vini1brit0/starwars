//
//  ListViewModel.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published private(set) var model: StarWarsModel?
    @Published var isLoading = false
    
    init() {
        Task.init {
            await fetchStarWarsData()
        }
    }
    
    private func fetchStarWarsData() async {
        isLoading = true
        do {
            guard let url = URL(string: Strings.baseURL) else {
                print(Strings.couldNotCreateURL + Strings.baseURL)
                isLoading = false
                return
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print(Strings.noSuccessResponse)
                isLoading = false
                return
            }
            
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(StarWarsModel.self, from: data) else {
                print(Strings.noDecodedData)
                return
            }
            
            DispatchQueue.main.async {
                self.model = decodedData
                self.isLoading = false
            }
        } catch {
            isLoading = false
            print("\(Strings.errorFetchingData): \(error)")
        }
    }
}
