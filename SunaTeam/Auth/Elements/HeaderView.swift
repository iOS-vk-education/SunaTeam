//
//  HeaderView.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 30.10.2024.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var largeText: String
    var smallText: String?
    var body: some View {
        Text(largeText)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.semibold)
            .padding(.bottom, 2)
        
        Text(smallText ?? "")
            .font(.body)
            .fontWeight(.regular)
            .foregroundStyle(.secondary)
    }
}
