//
//  DestinationPlanetViewModelTDD.swift
//  SpaceTrip
//
//  Created by Tanin on 26/04/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import Foundation

struct DestinationPlanetViewModelTDD {
    
    let spaceLifeSignDB: SpaceLifeSignDB
    var easterEggEnabled: Bool
    var makeEasterEggDatabase: () -> SpaceLifeSignDB
    
    func signOfLife(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
    
        if !easterEggEnabled {
            return spaceLifeSignDB.getLifeSigns(on: .mars)
        }
        
        if planet == .venus {
            return spaceLifeSignDB.getLifeSigns(on: .venus)
        }
        
        return makeEasterEggDatabase().getLifeSigns(on: .mars) + spaceLifeSignDB.getLifeSigns(on: .mars)
    }
    
}
