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
        case fetched(loadingMore: Bool)
        case failed
    }
    
    @Injected private var apiManager: APIManaging
    
    private var currentPage: Int = 1
        
    @Published var catBreeds: [CatBreed] = []
    @Published var state: State = .initial
    
    
    func fetchMoreIfNeeded(for catBreed: CatBreed) async {
        Logger.log("Try fetch more if needed for id: \(String(describing: catBreed.id))", .info)
        
        guard catBreed == catBreeds.last else {
            Logger.log("Last item, no need to fetch more", .info)
            return
        }
    
        
        Logger.log("Fetching more ...", .info)
        currentPage += 1
        state = .fetched(loadingMore: true)
        await fetch(page: currentPage)
    }
    
    
    func load() async {
        state = .loading
        await fetch()
    }
    
    
    func fetch(page: Int? = nil) async {
        do {

            let endpoint = CatBreedEndpoint.getCatBreeds(page: page)
            let newCatBreeds: [CatBreed] = try await apiManager.request(endpoint: endpoint)
            
            catBreeds += newCatBreeds

            state = .fetched(loadingMore: false)
        } catch {

            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .info)
                state = .fetched(loadingMore: false)
                return
            }

            debugPrint(error)
            state = .failed
        }
    }
}
