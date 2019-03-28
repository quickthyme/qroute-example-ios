
import XCTest
import UIKit
import QRoute

class ToParentNavigationControllerPopResolverActionTests: XCTestCase {

    let subject: QRouteResolver.ActionType.ToParent =
        ToParentNavigationControllerPopResolverAction()

    func test_resolve() {

        given("parent child routables in a navigation controller") {
            let childRoute = QRoute("presented")
            let parentRoute = QRoute("presenter", childRoute)
            let child = MockViewControllerRoutable(childRoute)
            let parent = MockViewControllerRoutable(parentRoute).inMockNavigationController
            let mockNavigationController = parent.mockNavigationController!
            mockNavigationController.pushViewController(child, animated: false)

            when("it is executed") {
                let (captured, completion) = captureRoutableCompletion()
                subject(child, [:], false, completion)

                then("the navigation controller should pop back to the parent") {
                    XCTAssertEqual(mockNavigationController.topViewController, parent)
                }
                with("last resolved routable match") {
                    XCTAssert(captured.value === parent)
                }
            }
        }
    }
}
