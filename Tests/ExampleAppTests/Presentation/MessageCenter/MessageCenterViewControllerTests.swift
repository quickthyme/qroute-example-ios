
import XCTest
import QRoute

class MessageCenterViewControllerTests: XCTestCase {

    var subject: MessageCenterViewController!
    var mockRouteDriver: QRouteDriverMock!

    override func setUp() {
        mockRouteDriver = QRouteDriverMock()
        subject = (StoryboardLoader.loadViewController(from: "MessageCenter") as! MessageCenterViewController)
        subject.routeDriver = mockRouteDriver
    }

    func test_configuration_and_events() {
        given_view_controller_has_been_presented(subject) {
            with("routeResolver") {
                XCTAssertEqual(subject.routeResolver?.route.id, AppRoute.id.MessageCenter)
            }

            when("play action") {
                mockRouteDriver.reset()
                subject.playAction(nil)
                then("it should drive (sub) to `self`") {
                    XCTAssertEqual(mockRouteDriver.timesCalled["driveSub()"], 1)
                    XCTAssertEqual(mockRouteDriver.getArgument("driveSub()", "targetId") as? String, AppRoute.id.MessageCenter)
                }
            }
        }
    }
}
