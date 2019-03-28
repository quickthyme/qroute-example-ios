
import XCTest
import QRoute

class HelpViewControllerTests: XCTestCase {

    var subject: HelpViewController!
    var mockRouteDriver: MockQRouteDriver!

    override func setUp() {
        mockRouteDriver = MockQRouteDriver()
        subject = (StoryboardLoader.loadViewController(from: "Help") as! HelpViewController)
        subject.routeDriver = mockRouteDriver
    }

    func test_configuration_and_events() {
        given_view_controller_has_been_presented(subject) {
            with("routeResolver") {
                XCTAssertEqual(subject.routeResolver?.route.id, AppRoute.id.Help)
            }
            when("messageCenter action") {
                mockRouteDriver.reset()
                subject.messageCenterAction(nil)
                then("it should drive to Message Center") {
                    XCTAssertEqual(mockRouteDriver.timesCalled_driveTo, 1)
                    XCTAssertEqual(mockRouteDriver.valueFor_driveTo_targetId, AppRoute.id.MessageCenter)
                }
            }
            when("contactUs action") {
                mockRouteDriver.reset()
                subject.contactUsAction(nil)
                then("it should drive to Contact Us") {
                    XCTAssertEqual(mockRouteDriver.timesCalled_driveTo, 1)
                    XCTAssertEqual(mockRouteDriver.valueFor_driveTo_targetId, AppRoute.id.ContactUs)
                }
            }
        }
    }
}
