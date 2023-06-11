//
//  CatBreedAppApp.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 05.06.2023.
//

import SwiftUI

@main
struct CatBreedApp: App {
    init() {
        setupSegmentedControlAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            CatBreedsListView(viewModel: CatBreedsListViewModel())
        }
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - UIKit shenanigans
private extension CatBreedApp {
    func setupSegmentedControlAppearance() {
        UISegmentedControl.appearance().backgroundColor = .appBackgroundSegmentedControlGeneral
        UISegmentedControl.appearance().selectedSegmentTintColor = .appBackgroundSegmentedControlSelected
        
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.appTextItemTitleInverse],
            for: .normal
        )
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.appTextItemTitle],
            for: .selected
        )
    }
}
