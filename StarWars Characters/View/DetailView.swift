//
//  DetailView.swift
//  StarWars Characters
//
//  Created by Marcus Monteiro on 18/08/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    var url: String = Strings.emptyString
    
    var body: some View {
        NavigationView {
            if let character = viewModel.characters {
                VStack {
                    List {
                        Text(Strings.height + (character.height ?? Strings.emptyString))
                        Text(Strings.mass + (character.mass ?? Strings.emptyString))
                        Text(Strings.hairColor + (character.hair_color ?? Strings.emptyString))
                        Text(Strings.skinColor + (character.skin_color ?? Strings.emptyString))
                        Text(Strings.eyeColor + (character.eye_color ?? Strings.emptyString))
                        Text(Strings.birthYear + (character.birth_year ?? Strings.emptyString))
                        Text(Strings.gender + (character.gender.rawValue))
                    }
                    .bold(true)
                    .navigationTitle(character.name ?? Strings.emptyString)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .tint( .black)
                            .scaleEffect(4)
                    }
                }
            }
        }
        .task {
            await viewModel.fetchCharacter(url: url)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: Strings.emptyString)
    }
}
