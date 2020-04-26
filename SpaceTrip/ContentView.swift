//
//  ContentView.swift
//  SpaceTrip
//
//  Created by Tanin on 28/03/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let vm = DestinationPlanetViewModel(
        spaceLifeSignDB: SeriousSpaceLifeSignDB(),
        easterEggDatabaseFactory: {FakeSpaceLifeSignDB()}
    )
    
    var body: some View {
        NavigationView {
            List(vm.availableDesinations(), id: \.self) { planet in
                NavigationLink(
                    destination: DetailView(planetDetailVM: PlanetDetailViewModel(planetName: planet))
                ) {
                    Text(planet)
                }
            }
            .navigationBarTitle("Planet", displayMode: .automatic)
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
