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
        setupNavigationBarAppearance()
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
    func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [
            .font: UIFont.appNavigationBarCompact,
            .foregroundColor: UIColor.appTextNavigationBar
        ]
        appearance.largeTitleTextAttributes = [
            .font: UIFont.appNavigationBarLarge,
            .foregroundColor: UIColor.appTextNavigationBar
        ]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        let standardAppearance = appearance.copy()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = .appBackgroundTabBar
        
        UINavigationBar.appearance().standardAppearance = standardAppearance
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = .appTintNavigationBar
    }
    
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
