//
//  DetailView.swift
//  SpaceTrip
//
//  Created by Tanin on 29/03/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var planetDetailVM: PlanetDetailViewModel
    
    var body: some View {
        planetDetailVM.content()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(planetDetailVM: PlanetDetailViewModel(planetName: "dagobah"))
    }
}
