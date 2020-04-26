//
//  SpaceTripTests.swift
//  SpaceTripTests
//
//  Created by Tanin on 03/04/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import XCTest
@testable import SpaceTrip

let marsLifeSign1: LifeSign = LifeSign(title: "Mars LifeSign 1", description: "Mars LifeSign 1 description", images: nil)
let venusLifeSign1: LifeSign = LifeSign(title: "Venus LifeSign 1", description: "Venus LifeSign 1 description", images: nil)
let mercuryLifeSign1: LifeSign = LifeSign(title: "Mercury LifeSign 1", description: "Mercury LifeSign 1 description", images: nil)

struct MockSpaceLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        switch planet {
        case .mercury:
            return [mercuryLifeSign1]
        case .venus:
            return [venusLifeSign1]
        case .mars:
            return [marsLifeSign1]
        }
    }
}

let marsEasterEggLifeSign1: LifeSign = LifeSign(
    title: "A red car with a space suit",
    description: "A red car identified to be Tesla's roaster with a SpaceX space suit called Starman was found crashed...",
    images: nil)

struct MockEasterEggLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        if planet == .mars {
            return [marsEasterEggLifeSign1]
        }
        return []
    }
}

class DestinationPlanetViewModelTests: XCTestCase {
    
    func createSystemUnderTest(easterEggEnabled: Bool) -> DestinationPlanetViewModel {
        return DestinationPlanetViewModel(
            spaceLifeSignDB: MockSpaceLifeSignDB(),
            easterEggEnabled: easterEggEnabled,
            easterEggDatabaseFactory: {MockEasterEggLifeSignDB()}
        )
    }
    
    // MARK: Mars
    
    func test_signOfLife_planetMars_easterEggEnabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // when
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], marsEasterEggLifeSign1)
        XCTAssertEqual(result[1], marsLifeSign1)
        
    }
    
    func test_signOfLife_planetMars_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // when
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], marsLifeSign1)
    }
    
    // MARK: Venus
    
    func test_signOfLife_planetVenus_easterEggEnabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // when
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], venusLifeSign1)
        
    }
    
    func test_signOfLife_planetVenus_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // when
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], venusLifeSign1)
        
    }
    
    // MARK: Mercury
    
    func test_signOfLife_planetMercury_easterEggEnabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .mercury)
        
        // when
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], mercuryLifeSign1)
        
    }
    
    func test_signOfLife_planetMercury_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mercury)
        
        // when
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], mercuryLifeSign1)
    }
    
}
