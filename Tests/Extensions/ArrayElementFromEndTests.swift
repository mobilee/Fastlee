//
//  ArrayElementFromEndTests.swift
//  Fastlee-iOSTests
//
//  Created by Łukasz Szarkowicz on 19/05/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import XCTest

class ArrayElementFromEndTests: XCTestCase {

    let testingArray = ["A", "B", "C", "D", "E", "F"]
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindElementWhenOutOfBounds() throws {
        let result = testingArray.element(fromEnd: 12)
        
        XCTAssertNil(result)
    }
    
    func testFindElementWhenInBounds() throws {
        let result = testingArray.element(fromEnd: 3)
        let result2 = testingArray.element(fromEnd: 0)
        
        XCTAssertEqual(result, "C")
        XCTAssertEqual(result2, "F")
        XCTAssertEqual(result2, testingArray.last)
    }
}
