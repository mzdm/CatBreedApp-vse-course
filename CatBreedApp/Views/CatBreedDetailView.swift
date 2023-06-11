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
    let breedMetadata: CatBreedMetadata
    
    func buildCardTiles() -> some View {
        HStack {
            VStack {
                Text((breedMetadata.lifeSpan ?? "-") + " y")
                    .font(.title)
                Text("Life span")
                    .font(.caption)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5))
            
            VStack {
                Text((breedMetadata.weight?.metric ?? "-") + " kg")
                    .font(.title)
                Text("Weight")
                    .font(.caption)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5))
        }
        .frame(maxWidth: .infinity)
    }
    
    func buildChipsFromTemperament() -> some View {
        let listOfTemperaments = breedMetadata.temperament?.split(separator: ",") ?? []
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
                AsyncImage(url: URL(string: breed.url ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit)
                    case .failure(_):
                        Rectangle()
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
                .frame(height: UIScreen.main.bounds.height * 0.4)
                .clipped()
            }.edgesIgnoringSafeArea(.top)
            
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Text(breedMetadata.name ?? "-")
                            .font(.title)
                        Spacer()
                        if let wikipediaUrl = breedMetadata.wikipediaURL {
                            NavigationLink(destination: InAppWebView(url: URL(string: wikipediaUrl)!)) {
                                Image(systemName: "link")
                                    .foregroundColor(.blue)
                            }
                        }
                       
                    }
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.gray)
                        Text(breedMetadata.origin ?? "Unknown origin")
                            .font(.caption)
                    }
                    buildCardTiles()
                    buildChipsFromTemperament()
                    Text("Description")
                        .font(.title)
                    Text(breedMetadata.description ?? "-")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                )
                .offset(y: UIScreen.main.bounds.height * 0.3 - 30)
            }
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}


struct CatBreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedDetailView(breed: .mock, breedMetadata: .mock(i: 0))
    }
}
