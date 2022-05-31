//
//  FA_AmanpreetKaur_C0854967_IOSsUITestsLaunchTests.swift
//  FA_AmanpreetKaur_C0854967_IOSsUITests
//
//  Created by Amanpreet Kaur on 2022-05-30.
//

import XCTest

class FA_AmanpreetKaur_C0854967_IOSsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
