//
//  CatBreedImage.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

struct CatBreedImage: View {
    let breed: CatBreed
    var height: CGFloat? = nil
    
    var body: some View {
        AsyncImage(url: URL(string: breed.url ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView().frame(height: height)
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit).frame(height: height, alignment: .top)
            case .failure(_):
                Rectangle()
                    .frame(height: height, alignment: .top)
                    .foregroundColor(.gray)
                    .overlay(
                        Image(systemName: "pawprint")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    )
            @unknown default:
                EmptyView()
            }
        }
        .clipped()
    }
}
