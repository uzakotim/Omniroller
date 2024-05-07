//
//  OmnirollerUITests.swift
//  OmnirollerUITests
//
//  Created by Timur Uzakov on 07.05.2024.
//

import XCTest


final class OmnirollerUITests: XCTestCase {
    var app: XCUIApplication!
    var pipe: Pipe!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
    func testSendsCommand() throws {
        let app = XCUIApplication()
        pipe = Pipe()
        let button = app.buttons["arrow.up"]
        app.buttons["start.stop"].tap()
        button.tap()
        sleep(2)
    
        let expected_command = "w 100"
        let command_label = button.value as! String
        XCTAssertEqual(command_label, expected_command, "Command name mismatch")
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
