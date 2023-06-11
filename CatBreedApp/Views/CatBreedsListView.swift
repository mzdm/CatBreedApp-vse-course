//
//  CatBreedsListView.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

struct CatBreedsListView: View {
    
    @ObservedObject var viewModel = CatBreedsListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    // TODO: SearchBar ?
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 180), spacing: 20.0),
                            GridItem(.adaptive(minimum: 180), spacing: 20.0)
                        ]) {
                            ForEach(viewModel.catBreeds) { breed in
                                if let breedMetadata = breed.breeds?.first {
                                        CatBreedTile(breed: breed, breedMetadata: breedMetadata)
                                            .padding(.bottom)
                                }
                            }
                        }
                        .padding(.horizontal)
                }
            }
        }.onFirstAppear {
            Task {
                await viewModel.load()
            }
        }
        .navigationBarTitle(Text("Cat Breeds"), displayMode: .inline)
    }
}

struct CatBreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedsListView()
    }
}
