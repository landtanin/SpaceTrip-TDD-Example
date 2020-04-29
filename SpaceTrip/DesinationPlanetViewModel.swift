//
//  DesinationPlanetViewModel.swift
//  SpaceTrip
//
//  Created by Tanin on 28/03/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import Foundation
import SwiftUI

typealias PlanetName = String

enum InnerSolarSystemDestinationPlanet: PlanetName, CaseIterable {
    case mercury, venus, mars
}

enum StarWarsPlanet: PlanetName, CaseIterable {
    case alderaan, dagobah, hoth, naboo, tatooine
}

extension RawRepresentable where RawValue == String {
    static func toRawValue(_ value: Self) -> PlanetName {
        value.rawValue
    }
}

// ----------------

struct LifeSign: Equatable {
    let title: String
    let description: String
    let images: [Image]?
}

protocol SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign]
}

struct FakeSpaceLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        
        if planet == .mars {
            return [
                LifeSign(
                    title: "A red car with a space suit",
                    description: "A red car identified to be Tesla's roaster with a SpaceX space suit called Starman was found crashed...",
                    images: nil)
            ]
        }
                
        return [LifeSign]()
        
    }
}

struct SeriousSpaceLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        
        return [
            LifeSign(
                title: "The \"Wow Signal\"",
                description: "If Jerry Ehman  had written what he was really thinking that day in 1977, “we’d be talking about the ‘Holy Sh*t!’ signal right now”, says H. Paul Shuch, Ehman, a volunteer researcher for Ohio State University’s now-defunct Big Ear radio observatory, perused data from the telescope’s scan of the skies on August 15, a few days earlier. In those days, such information was run through an IBM 1130 mainframe computer and printed on perforated paper, and then laboriously examined by hand. The tedium was shattered when Ehman spotted something surprising, a vertical column with the alphanumerical sequence “6EQUJ5,” which had occurred at 10:16 p.m. EST. He grabbed a red pen and circled the sequence. In the margin, wrote “Wow[ŌM1] !” Ohio State University researches picked up a signal coming from nearly 220 million light years away that was so powerful, it was named the “Wow Signal”. Scientist is baffled as to how a signal so strong could come from so far away without the use of advanced technology.",
                images: [Image("wow_signal")])
        ]
        
    }
}


struct DestinationPlanetViewModel {
    
    let spaceLifeSignDB: SpaceLifeSignDB
    var easterEggEnabled: Bool
    var makeEasterEggDatabase: () -> SpaceLifeSignDB
    
    init(
        spaceLifeSignDB: SpaceLifeSignDB,
        easterEggEnabled: Bool = false,
        easterEggDatabaseFactory: @escaping () -> SpaceLifeSignDB
    ) {
        self.spaceLifeSignDB = spaceLifeSignDB
        self.easterEggEnabled = easterEggEnabled
        self.makeEasterEggDatabase = easterEggDatabaseFactory
    }
    
    func availableDesinations() -> [PlanetName] {
        
        let planets = InnerSolarSystemDestinationPlanet.allCases.map(InnerSolarSystemDestinationPlanet.toRawValue)
        return planets
        
    }
    
    func signOfLife(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        
        var lifeSigns = [LifeSign]()
        if easterEggEnabled && planet == .mars {
            let db = makeEasterEggDatabase()
            lifeSigns.append(contentsOf: db.getLifeSigns(on: planet))
        }
        
        lifeSigns.append(contentsOf: spaceLifeSignDB.getLifeSigns(on: planet))
        return lifeSigns
                
    }
        
}

struct PlanetDetailViewModel {
    
    let planetName: PlanetName
    
    func content() -> some View {
        Image(planetName)
            .resizable()
            .scaledToFit()
    }
    
}
