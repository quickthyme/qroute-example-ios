
import XCTest
import QRoute

class ToDoViewControllerTests: XCTestCase {

    var subject: ToDoViewController!
    var mockRouteDriver: QRouteDriverMock!

    override func setUp() {
        mockRouteDriver = QRouteDriverMock()
        subject = (StoryboardLoader.loadViewController(from: "ToDo") as! ToDoViewController)
        subject.routeDriver = mockRouteDriver
    }

    func test_configuration_and_events() {
        given_view_controller_has_been_presented(subject) {
            with("routeResolver") {
                XCTAssertEqual(subject.routeResolver?.route.id, AppRoute.id.ToDo)
            }
            when("making selection") {
                mockRouteDriver.reset()
                subject.toDoTableViewManager(ToDoTableViewManager(), didSelectId: 36)
                then("it should drive to ToDoDetail with toDoId input") {
                    let receivedInput = mockRouteDriver.getArgument("driveTo()", "input") as! [String:Any]
                    XCTAssertEqual(mockRouteDriver.timesCalled["driveTo()"], 1)
                    XCTAssertEqual(mockRouteDriver.getArgument("driveTo()", "targetId") as? String, AppRoute.id.ToDoDetail)
                    XCTAssertEqual(receivedInput["toDoId"] as? Int, 36)
                }
            }
        }
    }
}
