//
//  SpaceTripTests.swift
//  SpaceTripTests
//
//  Created by Tanin on 03/04/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import XCTest
@testable import SpaceTrip

let lifeSign1: LifeSign = LifeSign(title: "LifeSign 1", description: "LifeSign 1 description", images: nil)

struct MockSpaceLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        
        [lifeSign1]
    }
}

let easterEggLifeSign1: LifeSign = LifeSign(title: "EasterEggLifeSign 1", description: "EasterEggLifeSign 1 description", images: nil)

struct MockEasterEggLifeSignDB: SpaceLifeSignDB {
    func getLifeSigns(on planet: InnerSolarSystemDestinationPlanet) -> [LifeSign] {
        [easterEggLifeSign1]
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
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // when
        XCTAssertEqual(result.count, 2)
//        if !result.isEmpty {
            XCTAssertEqual(result[0], easterEggLifeSign1)
            XCTAssertEqual(result[1], lifeSign1)
//        }
        
    }
    
    func test_signOfLife_planetMars_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // when
        XCTAssertEqual(result.count, 1)
        if !result.isEmpty {
            XCTAssertEqual(result[0], lifeSign1)
        }
    }

    // MARK: Venus
    
    func test_signOfLife_planetVenus_easterEggEnabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // when
        XCTAssertEqual(result.count, 1)
        if !result.isEmpty {
            XCTAssertEqual(result[0], lifeSign1)
        }
        
    }
    
    func test_signOfLife_planetVenus_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // when
        XCTAssertEqual(result.count, 1)
        if !result.isEmpty {
            XCTAssertEqual(result[0], lifeSign1)
        }
        
    }
    
    // MARK: Mercury
    
    func test_signOfLife_planetMercury_easterEggEnabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .mercury)
        
        // when
        XCTAssertEqual(result.count, 1)
        if !result.isEmpty {
            XCTAssertEqual(result[0], lifeSign1)
        }
        
    }
    
    func test_signOfLife_planetMercury_easterEggDisabled() {
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // when
        XCTAssertEqual(result.count, 1)
        if !result.isEmpty {
            XCTAssertEqual(result[0], lifeSign1)
        }
        
    }
    
}
