//
//  DefaultsTests.swift
//  Fastlee-iOSTests
//
//  Created by Lukasz Szarkowicz on 01/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

@testable import Fastlee
import XCTest

class DefaultsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        resetUserDefaults()
    }
    
    private func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Defaults.Keys.someInt)
        UserDefaults.standard.removeObject(forKey: Defaults.Keys.optionalInt)
        UserDefaults(suiteName: Defaults.suite)?.removeObject(forKey: Defaults.Keys.someIntCustomSuite)
        UserDefaults(suiteName: Defaults.suite)?.removeObject(forKey: Defaults.Keys.optionalIntCustomSuite)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSomeIntOnStandardDatabase() {
        
        XCTAssertEqual(Defaults.someInt, 3)
        
        Defaults.someInt = 5
        XCTAssertEqual(Defaults.someInt, 5)
        
        Defaults.someInt = 7
        XCTAssertEqual(Defaults.someInt, 7)
        let straightFromDatabase = UserDefaults.standard.object(forKey: Defaults.Keys.someInt) as? Int
        XCTAssertEqual(straightFromDatabase, 7)
        
        UserDefaults.standard.removeObject(forKey: Defaults.Keys.someInt)
        XCTAssertEqual(Defaults.someInt, 3)
    }
    
    func testOptionalIntOnStandardDatabase() {
        
        XCTAssertEqual(Defaults.optionalInt, nil)
        
        Defaults.optionalInt = 5
        XCTAssertEqual(Defaults.optionalInt, 5)
        
        Defaults.optionalInt = 7
        XCTAssertEqual(Defaults.optionalInt, 7)
        let straightFromDatabase = UserDefaults.standard.object(forKey: Defaults.Keys.optionalInt) as? Int
        XCTAssertEqual(straightFromDatabase, 7)
        
        UserDefaults.standard.removeObject(forKey: Defaults.Keys.optionalInt)
        XCTAssertEqual(Defaults.optionalInt, nil)
    }
    
    func testSaveInCustomSuite() {
        let const = 22
        UserDefaults(suiteName: "test1")?.set(const, forKey: "test_1_suite")
        let value = UserDefaults(suiteName: "test1")?.object(forKey: "test_1_suite") as? Int
        XCTAssertEqual(value, const)
    }
    
    func testSomeIntOnCustomDatabase() {
        
        XCTAssertEqual(Defaults.someIntCustomSuite, 6)
        
        let zero = getIntObjectStraightFromSuite(for: Defaults.Keys.someIntCustomSuite)
        XCTAssertEqual(zero, nil)
        
        Defaults.someIntCustomSuite = 5
        XCTAssertEqual(Defaults.someIntCustomSuite, 5)
        let first = getIntObjectStraightFromSuite(for: Defaults.Keys.someIntCustomSuite)
        XCTAssertEqual(first, 5)
        
        Defaults.someIntCustomSuite = 7
        XCTAssertEqual(Defaults.someIntCustomSuite, 7)
        let second = getIntObjectStraightFromSuite(for: Defaults.Keys.someIntCustomSuite)
        XCTAssertEqual(second, 7)
        let fromStandard = UserDefaults.standard.object(forKey: Defaults.Keys.someIntCustomSuite) as? Int
        XCTAssertNotEqual(fromStandard, 7)
        
        UserDefaults(suiteName: Defaults.suite)?.removeObject(forKey: Defaults.Keys.someIntCustomSuite)
        XCTAssertEqual(Defaults.someIntCustomSuite, 6)
    }
    
    func testOptionalIntOnCustomDatabase() {
        
        XCTAssertEqual(Defaults.optionalIntCustomSuite, nil)
        
        let zero = getIntObjectStraightFromSuite(for: Defaults.Keys.optionalIntCustomSuite)
        XCTAssertEqual(zero, nil)
        
        Defaults.optionalIntCustomSuite = 5
        XCTAssertEqual(Defaults.optionalIntCustomSuite, 5)
        let first = getIntObjectStraightFromSuite(for: Defaults.Keys.optionalIntCustomSuite)
        XCTAssertEqual(first, 5)
        
        Defaults.optionalIntCustomSuite = 7
        XCTAssertEqual(Defaults.optionalIntCustomSuite, 7)
        let second = getIntObjectStraightFromSuite(for: Defaults.Keys.optionalIntCustomSuite)
        XCTAssertEqual(second, 7)
        let fromStandard = UserDefaults.standard.object(forKey: Defaults.Keys.optionalIntCustomSuite) as? Int
        XCTAssertNotEqual(fromStandard, 7)
        
        UserDefaults(suiteName: Defaults.suite)?.removeObject(forKey: Defaults.Keys.optionalIntCustomSuite)
        XCTAssertEqual(Defaults.optionalIntCustomSuite, nil)
    }
    
    func getIntObjectStraightFromSuite(for key: String) -> Int? {
        return UserDefaults(suiteName: Defaults.suite)?.object(forKey: key) as? Int
    }
}

fileprivate class Defaults {
    
    static var suite: String = "pl.test.app"
    
    enum Keys {
        static let someInt = "some_int_value"
        static let optionalInt = "optional_int"
        static let someIntCustomSuite = "some_int_value"
        static let optionalIntCustomSuite = "optional_int"
    }
    
    @UserDefault(key: Keys.someInt, defaultValue: 3)
    static var someInt: Int
   
    @OptionalUserDefault(key: Keys.optionalInt)
    static var optionalInt: Int?
    
    @UserDefault(key: Keys.someIntCustomSuite, defaultValue: 6, suiteName: suite)
    static var someIntCustomSuite: Int
    
    @OptionalUserDefault(key: Keys.optionalIntCustomSuite, suiteName: suite)
    static var optionalIntCustomSuite: Int?
}
