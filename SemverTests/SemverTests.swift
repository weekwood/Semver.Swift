//
//  SemverTests.swift
//  SemverTests
//
//  Created by di wu on 2/17/15.
//  Copyright (c) 2015 di wu. All rights reserved.
//

import UIKit
import XCTest
import Semver
class SemverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testVaild() {
        XCTAssertFalse(Semver.valid("a.b.c"), "pass")
        XCTAssertTrue(Semver.valid("1.3.4"), "pass")
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
