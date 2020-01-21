//
//  ContentViewOverlay.swift
//  NewsAPIListing
//
//  Created by Полина on 19.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import SwiftUI

struct ContentViewOverlay: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                AppState.shared.toggleOverlay()
        }
    }
}

struct ContentViewOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOverlay()
    }
}
