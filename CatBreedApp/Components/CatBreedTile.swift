//
//  CatBreedTile.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

struct CatBreedTile: View {
    let breed: CatBreed
    let breedMetadata: CatBreedMetadata
    
    var body: some View {
        NavigationLink(
            destination: CatBreedDetailView(breed: breed, breedMetadata: breedMetadata))
        {
            VStack {
                AsyncImage(url: URL(string: breed.url ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().frame(height: 180)
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit).frame(height: 120, alignment: .top)
                    case .failure(_):
                        Rectangle()
                            .frame(height: 180, alignment: .top)
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
                
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(breedMetadata.name ?? "?")
                            .font(.headline)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        if let origin = breedMetadata.origin {
                            Text(origin)
                                .font(.caption)
                                .foregroundColor(Color.appTextCaption)
                        }
                    }
                    .padding([.leading, .bottom], 12)
                    Spacer()
                }
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
        }
    }
}

struct CatBreedTile_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedTile(breed: .mock, breedMetadata: .mock(i: 0))
    }
}
