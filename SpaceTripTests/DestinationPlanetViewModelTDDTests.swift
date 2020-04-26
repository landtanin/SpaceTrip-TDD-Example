//
//  DestinationPlanetViewModelTDDTests.swift
//  SpaceTripTests
//
//  Created by Tanin on 26/04/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import XCTest
@testable import SpaceTrip

class DestinationPlanetViewModelTDDTests: XCTestCase {
    
    func createSystemUnderTest(easterEggEnabled: Bool) -> DestinationPlanetViewModelTDD {
        return DestinationPlanetViewModelTDD(
            spaceLifeSignDB: MockSpaceLifeSignDB(),
            easterEggEnabled: easterEggEnabled,
            makeEasterEggDatabase: { MockEasterEggLifeSignDB() }
        )
    }
    
    func test_signOfLife_planetMars_easterEggEnabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // then
        XCTAssertEqual(result.count, 2)
        if result.count == 2 {
            XCTAssertEqual(result[0], marsEasterEggLifeSign1)
            XCTAssertEqual(result[1], marsLifeSign1)
        }
        
    }
    
    func test_signOfLife_planetMars_easterEggDisabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mars)
        
        // then
        XCTAssertEqual(result.count, 1)
        if result.count == 1 {
            XCTAssertEqual(result[0], marsLifeSign1)
        }
        
    }
    
    func test_signOfLife_planetVenus_easterEggEnabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // then
        XCTAssertEqual(result.count, 1)
        if result.count == 1 {
            XCTAssertEqual(result[0], venusLifeSign1)
        }
        
    }
    
    func test_signOfLife_planetVenus_easterEggDisabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .venus)
        
        // then
        XCTAssertEqual(result.count, 1)
        if result.count == 1 {
            XCTAssertEqual(result[0], venusLifeSign1)
        }
        
    }
    
    func test_signOfLife_planetMercury() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: false)
        
        // when
        let result = sut.signOfLife(on: .mercury)
        
        // then
        XCTAssertEqual(result.count, 1)
        if result.count == 1 {
            XCTAssertEqual(result[0], mercuryLifeSign1)
        }
        
    }
    
}
