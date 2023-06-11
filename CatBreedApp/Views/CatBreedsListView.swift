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
                VStack {
                    // TODO: SearchBar ?
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 180), spacing: 20.0),
                            GridItem(.adaptive(minimum: 180), spacing: 20.0)
                        ]) {
                            ForEach(viewModel.catBreeds) { breed in
                                // TODO: fix null
                                CatBreedTile(breed: breed, breedMetadata: breed.breeds!.first!)
                                    .padding(.bottom)
                            }
                        }
                        .padding(.horizontal)
                }
            }
            .navigationBarTitle(Text("Cat Breeds"), displayMode: .inline)
        }.onFirstAppear {
            Task {
                await viewModel.load()
            }
        }
    }
}

struct CatBreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedsListView()
    }
}