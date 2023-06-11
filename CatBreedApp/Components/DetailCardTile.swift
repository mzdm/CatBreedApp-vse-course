//
//  DetailCardTile.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import SwiftUI

struct DetailCardTile: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title)
            Text(label)
                .font(.caption)
                .foregroundColor(Color.appTextCaption)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}
