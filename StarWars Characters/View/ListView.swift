//
//  ListView.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                if let starWarsModel = viewModel.model?.results {
                    ZStack {
                        List (starWarsModel, id: \.self) { result in
                            VStack {
                                NavigationLink(destination: DetailView(url: result.url)) {
                                    Text(result.name ?? Strings.emptyString)
                                }
                            }
                            .padding()
                        }
                        .bold(true)
                        .navigationTitle(Strings.mainTitle)
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .tint( .black)
                                .scaleEffect(4)
                        }
                    }
                }
            } else {
                VStack {
                    Image(systemName: Strings.noWiFi)
                        .foregroundStyle( .red)
                    Text(Strings.noInternet)
                }
            }
        }
        .tint(.black)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

