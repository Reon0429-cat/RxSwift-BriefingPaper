//
//  RxSwift_BriefingPaper_SampleUITestsLaunchTests.swift
//  RxSwift-BriefingPaper-SampleUITests
//
//  Created by 大西玲音 on 2021/12/05.
//

import XCTest

class RxSwift_BriefingPaper_SampleUITestsLaunchTests: XCTestCase {

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
