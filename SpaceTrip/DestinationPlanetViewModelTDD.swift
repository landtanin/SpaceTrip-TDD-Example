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
        
        if !easterEggEnabled && planet != .venus {
            if planet == .mercury {
                return spaceLifeSignDB.getLifeSigns(on: planet)
            }
            return spaceLifeSignDB.getLifeSigns(on: .mars)
        }
        
        if planet == .venus {
            return spaceLifeSignDB.getLifeSigns(on: .venus)
        }
        
        return makeEasterEggDatabase().getLifeSigns(on: .mars) + spaceLifeSignDB.getLifeSigns(on: .mars)
    }
    
    func signOfLife2(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
    
        if easterEggEnabled && planet == .mars {
            return makeEasterEggDatabase().getLifeSigns(on: .mars) + spaceLifeSignDB.getLifeSigns(on: .mars)
        }
        
        return spaceLifeSignDB.getLifeSigns(on: planet)
        
    }
    
}
