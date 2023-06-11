//
//  CatBreedsListView.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI
import Lottie

struct CatBreedsListView: View {
    
    @ObservedObject var viewModel = CatBreedsListViewModel()
    
    func getGridItemLayout() -> [GridItem] {
        return [
            GridItem(.adaptive(minimum: 180), spacing: 20.0),
            GridItem(.adaptive(minimum: 180), spacing: 20.0)
        ]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    switch viewModel.state {
                    case .initial, .loading:
                        ProgressView()
                    case .fetched:
                        if (viewModel.catBreeds.isEmpty) {
                            LottieView(lottieFile: "empty-state")
                                .frame(width: 200, height: 200)
                                .padding(.top, 100)
                        } else {
                            LazyVGrid(
                                columns: getGridItemLayout()
                            ) {
                                ForEach(viewModel.catBreeds) { breed in
                                    NavigationLink(destination: CatBreedDetailView(breed: breed)) {
                                        CatBreedTile(breed: breed)
                                            .padding(.bottom)
                                    }
                                }
                                .padding(.horizontal)
                            }
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
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) { newValue in
            viewModel.filterCatBreeds()
        }
        .navigationBarTitle(Text("Cat Breeds"))
    }
}

struct CatBreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedsListView()
    }
}
