
import XCTest
import QRoute

class ToDoDetailViewControllerTests: XCTestCase {

    var subject: ToDoDetailViewController!
    var mockRouteDriver: QRouteDriverMock!

    override func setUp() {
        mockRouteDriver = QRouteDriverMock()
        subject = (StoryboardLoader.loadViewController(from: "ToDoDetail") as! ToDoDetailViewController)
        subject.routeDriver = mockRouteDriver
    }

    func test_configuration_and_events() {
        given("it has route input with 'toDoId' set") {
            subject.routeResolver.input = ["toDoId":88]

            given_view_controller_has_been_presented(subject) {

                with("routeResolver") {
                    XCTAssertEqual(subject.routeResolver?.route.id, AppRoute.id.ToDoDetail)
                }
                with("title incudes the route input toDoId") {
                    XCTAssertEqual(subject.navigationItem.title, "Item 88")
                }

                when("contactUsNear action") {
                    mockRouteDriver.reset()
                    subject.contactUsNearAction(nil)
                    then("it should drive (sub) to Contact Us") {
                        XCTAssertEqual(mockRouteDriver.timesCalled["driveSub()"], 1)
                        XCTAssertEqual(mockRouteDriver.getArgument("driveSub()", "targetId") as? String, AppRoute.id.ContactUs)
                    }
                }

                when("contactUsFar action") {
                    mockRouteDriver.reset()
                    subject.contactUsFarAction(nil)
                    then("it should drive all the way to Contact Us") {
                        XCTAssertEqual(mockRouteDriver.timesCalled["driveTo()"], 1)
                        XCTAssertEqual(mockRouteDriver.getArgument("driveTo()", "targetId") as? String, AppRoute.id.ContactUs)
                    }
                }
            }
        }
    }
}
