//
//  SemverSwiftTests.swift
//  SemverSwiftTests
//
//  Created by Thales Lima on 3/25/15.
//  Copyright (c) 2015 Semver. All rights reserved.
//

import UIKit
import XCTest

class SemverSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValid() {
        XCTAssertFalse(Semver.valid("a.b.c"), "pass")
        XCTAssertTrue(Semver.valid("1.3.4-pre.1+ver.1"), "pass")
        XCTAssertTrue(Semver.valid("1.3.4+ver.1"), "pass")
        XCTAssertTrue(Semver.valid("1.3.4-pre.1"), "pass")
    }
    
    func testClean() {
        XCTAssertEqual("1.2.3", Semver.clean("   =v1.2.3     "), "pass")
    }
    
    func testLt() {
        XCTAssertTrue(Semver.lt("1.2.3", version2: "9.8.1"), "pass")
    }
    
    func testGt() {
        XCTAssertFalse(Semver.gt("1.2.3", version2: "9.8.1"), "pass")
    }
    
}
