//
//  CatBreedDetailView.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

import SwiftUI
import WrappingHStack

struct CatBreedDetailView: View {
    let breed: CatBreed
    
    func buildCardTilesSection() -> some View {
        HStack {
            DetailCardTile(
                label: "Life span",
                value: breed.lifeSpan ?? "-"
            )
            DetailCardTile(
                label: "Weight",
                value: (breed.weight?.metric ?? "-") + " kg"
            )
        }
        .frame(maxWidth: .infinity)
    }
    
    func buildChipsFromTemperament() -> some View {
        let listOfTemperaments = breed.temperament?.split(separator: ",") ?? []
        return WrappingHStack(alignment: .center) {
            ForEach(listOfTemperaments, id: \.self) { temperament in
                Text(temperament.trimmingCharacters(in: .whitespacesAndNewlines))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
    }
    
    var body: some View {
        ZStack() {
            GeometryReader { GeometryProxy in
                CatBreedImage(breed: breed)
                    .frame(height: UIScreen.main.bounds.height * 0.4)
            }.edgesIgnoringSafeArea(.top)
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Text(breed.name ?? "-")
                            .font(.title)
                        Spacer()
                        if let wikipediaUrl = breed.wikipediaURL {
                            NavigationLink(destination: InAppWebView(url: URL(string: wikipediaUrl)!)) {
                                Image(systemName: "link")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                    }
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.gray)
                        Text(breed.origin ?? "Unknown origin")
                            .font(.caption)
                            .foregroundColor(Color.appTextCaption)
                    }
                    buildCardTilesSection()
                    buildChipsFromTemperament()
                        .padding(.bottom, 10)
                    Text("Description")
                        .font(.title)
                        .padding(.bottom, 4)
                    Text(breed.description ?? "-")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                )
            }.offset(y: UIScreen.main.bounds.height * 0.3 - 30)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct CatBreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedDetailView(breed: .catBreedsMock.first!)
    }
}
