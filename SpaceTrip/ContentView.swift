//
//  ContentView.swift
//  SpaceTrip
//
//  Created by Tanin on 28/03/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(["PlanetA", "PlanetB"], id: \.self, rowContent: Text.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
