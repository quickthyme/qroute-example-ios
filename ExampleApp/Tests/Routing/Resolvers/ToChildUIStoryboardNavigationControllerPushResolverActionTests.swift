
import XCTest
import UIKit
import QRoute

class ToChildUIStoryboardNavigationControllerPushResolverActionTests: XCTestCase {

    let subject: QRouteResolver.ActionType.ToChild =
        ToChildUIStoryboardNavigationControllerPushResolverAction()
    let inputStream: QRoutableInput = [
        "somethingForSusan":"123.45.678.910.11.12",
        "somethingForBruce":[1,-1]
    ]

    func test_resolve() {

        given("source, target, inputStream, animated, completion") {
            let target = QRoute("MockViewControllerRoutable")
            let mockRoutable = MockViewControllerRoutable(QRoute("source", target))
                .inMockNavigationController

            when("executed") {
                let (captured, completion) = captureRoutableCompletion()
                subject(target, mockRoutable, inputStream, true, completion)

                then("it should have pushed a view controller") {
                    let topVC = mockRoutable.mockNavigationController?.topViewController
                    XCTAssertNotNil(topVC)
                    XCTAssert(topVC is MockViewControllerRoutable)
                    XCTAssert(topVC !== mockRoutable)
                }
                then("it should have called the completion handler with correct routable") {
                    XCTAssertEqual(captured.value?.routeResolver?.route, target)
                }
            }
        }
    }
}
