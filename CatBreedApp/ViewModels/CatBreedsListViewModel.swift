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
    
    private var currentPage: Int?
        
    @Published var catBreeds: [CatBreed] = []
    @Published var state: State = .initial
    
    
    func fetchMoreIfNeeded(for catBreed: CatBreed) async {
        
        guard catBreed == catBreeds.last else {
            return
        }
        
        guard let page = currentPage else {
            return
        }
        
        state = .fetched(loadingMore: true)
        await fetch(page: page)
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
