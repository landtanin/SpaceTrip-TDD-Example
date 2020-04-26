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
            XCTAssertEqual(result[0], easterEggLifeSign1)
            XCTAssertEqual(result[1], lifeSign1)
        }
        
    }
    
    func test_signOfLife_planetEarth_easterEggEnabled() {
        
        // given
        let sut = createSystemUnderTest(easterEggEnabled: true)
        
        // when
        let result = sut.signOfLife(on: .earth)
        
        // then
        XCTAssertEqual(result.count, 1)
        if result.count == 1 {
            XCTAssertEqual(result[0], lifeSign1)
        }
        
    }
    
}
