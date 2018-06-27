//
//  MyGalaxyOfAppleSdksTests.swift
//  MyGalaxyOfAppleSdksTests
//
//  Created by Serhat Sarı on 26.06.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

import XCTest
@testable import MyGalaxyOfAppleSdks

class MyGalaxyOfAppleSdksTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRanges() {
        let string1 = "to Fuck or not to fuck"
        let ranges1 = string1.ranges(of: "Fuck", options: .caseInsensitive)
        
        XCTAssertTrue(ranges1.count == 2)
        XCTAssertTrue(ranges1.first?.lowerBound.hashValue == 12)
        XCTAssertTrue(ranges1.first?.upperBound.hashValue == 28)
        XCTAssertTrue(ranges1.last?.lowerBound.hashValue == 72)
        XCTAssertTrue(ranges1.last?.upperBound.hashValue == 88)
        
        //////////
        let string2 = "to be or not to be"
        let ranges2 = string2.ranges(of: "Fuck", options: .caseInsensitive)
        
        XCTAssertTrue(ranges2.count == 0)

        //////////
        let string3 = "Fucking idiot"
        let ranges3 = string3.ranges(of: "Fuck", options: .caseInsensitive)
        
        XCTAssertTrue(ranges3.count == 1)
        XCTAssertTrue(ranges3.first?.lowerBound.hashValue == 0)
        XCTAssertTrue(ranges3.first?.upperBound.hashValue == 16)

    }
    
}
