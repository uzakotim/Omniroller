//
//  OmnirollerUITests.swift
//  OmnirollerUITests
//
//  Created by Timur Uzakov on 07.05.2024.
//

import XCTest

final class OmnirollerUnitTests: XCTestCase {

    func testIPAddress(){
        func isIPAddress(_ input: String) -> Bool {
            let ipRegex = #"^(\d{1,3}\.){3}\d{1,3}$"#
            if let _ = input.range(of: ipRegex, options: .regularExpression) {
                return input.split(separator: ".").allSatisfy { segment in
                    if let num = Int(segment), num >= 0 && num <= 255 {
                        return true
                    }
                    return false
                }
            }
            return false
        }
        XCTAssertEqual(isIPAddress("192.168.1.1"), true)
        XCTAssertEqual(isIPAddress("192.168.1.256"), false)
        XCTAssertEqual(isIPAddress("192.168.1.a"), false)
        XCTAssertEqual(isIPAddress("uVay3t0KooVCdvABO2dXISNjB5SooCrP"), false)
    }
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
