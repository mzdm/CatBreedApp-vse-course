//
//  CatBreedsListViewModel.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import Foundation

@MainActor final class CatBreedsListViewModel: ObservableObject {

    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    @Injected private var apiManager: APIManaging
        
    var allCatBreeds: [CatBreed] = []
    @Published var catBreeds: [CatBreed] = []
    
    @Published var state: State = .initial
    @Published var searchText: String = ""

    func filterCatBreeds() {
        if (state != .fetched) {
            return
        }
        if searchText.isEmpty {
            catBreeds = allCatBreeds
        } else {
            catBreeds = allCatBreeds.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
        }
    }
    
    
    func load() async {
        state = .loading
        await fetch()
    }
    
    
    func fetch() async {
        do {

            let endpoint = CatBreedEndpoint.getCatBreeds
            let newCatBreeds: [CatBreed] = try await apiManager.request(endpoint: endpoint)
            
            allCatBreeds = newCatBreeds
            catBreeds = allCatBreeds

            state = .fetched
        } catch {

            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .info)
                state = .fetched
                return
            }

            debugPrint(error)
            state = .failed
        }
    }
}
