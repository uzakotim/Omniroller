//
//  OmnirollerUITests.swift
//  OmnirollerUITests
//
//  Created by Timur Uzakov on 07.05.2024.
//

import XCTest

let FRICTION_ROTATION_SPEED_DIFFERENCE : Int = 0

final class OmnirollerUITests: XCTestCase {
    
    var app: XCUIApplication!

        override func setUp() {
            super.setUp()
            app = XCUIApplication()
            app.launch()
        }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testHasButtons() throws {
        let app = XCUIApplication()
        XCTAssertTrue(app.buttons["start.stop"].exists)
        XCTAssertTrue(app.buttons["arrow.up.left"].exists)
        XCTAssertTrue(app.buttons["arrow.up.right"].exists)
        XCTAssertTrue(app.buttons["arrow.down.left"].exists)
        XCTAssertTrue(app.buttons["arrow.down.right"].exists)
        XCTAssertTrue(app.buttons["arrow.left"].exists)
        XCTAssertTrue(app.buttons["arrow.right"].exists)
        XCTAssertTrue(app.buttons["arrow.up"].exists)
        XCTAssertTrue(app.buttons["arrow.down"].exists)
        
//                app.buttons["MyButton"].tap()
//                XCTAssert(app.staticTexts["ResultLabel"].exists)
    }
    func testArrowsCommands() throws {
        var button = app.buttons["arrow.up"]
        app.buttons["start.stop"].tap()
        button.tap()
        sleep(1)
    
        var expected_command = "w 100"
        var command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        
        button = app.buttons["arrow.down"]
        button.tap()
        sleep(1)
    
        expected_command = "s 100"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.up.left"]
        button.tap()
        sleep(1)
    
        expected_command = "q \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.up.right"]
        button.tap()
        sleep(1)
    
        expected_command = "e \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.down.left"]
        button.tap()
        sleep(1)
    
        expected_command = "z \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.down.right"]
        button.tap()
        sleep(1)
    
        expected_command = "c \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.left"]
        button.tap()
        sleep(1)
    
        expected_command = "a \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
        button = app.buttons["arrow.right"]
        button.tap()
        sleep(1)
    
        expected_command = "d \(100+FRICTION_ROTATION_SPEED_DIFFERENCE)"
        command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
        
    }
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
    override func tearDown() {
            super.tearDown()
            app = nil
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
