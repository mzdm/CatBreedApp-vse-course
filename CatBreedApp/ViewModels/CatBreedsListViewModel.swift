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
    
    private var currentPageInfo: Response<[CatBreed]>.Info?
    
    @Published var catBreeds: [CatBreed] = []
    @Published var state: State = .initial
    
    
    func fetchMoreIfNeeded(for catBreed: CatBreed) async {
        
        guard catBreed == catBreeds.last else {
            return
        }
        
        guard let page = currentPageInfo?.next else {
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
        catBreeds += CatBreed.catBreeds
        state = .fetched(loadingMore: false)
        
        
//        do {
//
//            let endpoint = CharacterEndpoint.getCharacters(page: page)
//
//            let response: Response<[Character]> = try await apiManager.request(endpoint: endpoint)
//
//            currentPageInfo = response.info
//            characters += response.results
//
//            state = .fetched(loadingMore: false)
//        } catch {
//
//            if let error = error as? URLError, error.code == .cancelled {
//                Logger.log("URL request was cancelled", .info)
//
//                state = .fetched(loadingMore: false)
//
//                return
//            }
//
//            debugPrint(error)
//            state = .failed
//        }
    }
}
