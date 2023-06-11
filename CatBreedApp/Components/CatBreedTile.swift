//
//  CatBreedTile.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

struct CatBreedTile: View {
    let breed: CatBreed
    
    var body: some View {
        VStack {
            CatBreedImage(breed: breed, height: 120)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(breed.name ?? "?")
                        .font(.headline)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    if let origin = breed.origin {
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

struct CatBreedTile_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedTile(breed: .catBreedsMock.first!)
    }
}
