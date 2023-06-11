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
                    
                    switch viewModel.state {
                    case .initial, .loading:
                        ProgressView()
                    case .fetched(let loadingMore):
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: 180), spacing: 20.0),
                                GridItem(.adaptive(minimum: 180), spacing: 20.0)
                            ]) {
                                ForEach(viewModel.catBreeds) { breed in
                                    if let breedMetadata = breed.breeds?.first {
                                        NavigationLink(
                                            destination: CatBreedDetailView(
                                                breed:breed,
                                                breedMetadata: breedMetadata)
                                        ) {
                                            CatBreedTile(
                                                breed: breed,
                                                breedMetadata: breedMetadata
                                            )
                                            .padding(.bottom)
                                        }
                                        .task {
                                            await viewModel.fetchMoreIfNeeded(for: breed)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        
                        if loadingMore {
                            ProgressView()
                        }
                    case .failed:
                        Text("Something went wrong 😕")
                    }
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
