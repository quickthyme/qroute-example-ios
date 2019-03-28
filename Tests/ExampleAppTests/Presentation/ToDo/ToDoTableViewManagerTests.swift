
import XCTest

class ToDoTableViewManagerTests: XCTestCase {

    var subject: ToDoTableViewManager!
    var mockDelegate: MockToDoTableViewManagerDelegate!
    var mockTableView: UITableView!
    let hundoFrame = CGRect(x: 0, y: 0, width: 100, height: 100)

    override func setUp() {
        mockDelegate = MockToDoTableViewManagerDelegate()

        subject = ToDoTableViewManager()
        subject.delegate = mockDelegate

        mockTableView = UITableView(frame: hundoFrame, style: .grouped)
        mockTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellReuseIdentifier")
        mockTableView.dataSource = subject
        mockTableView.delegate = subject
    }

    func test_to_do_table_view_manager() {
        given("subject with delegate") {
            XCTAssertNotNil(subject.delegate)

            when("get number of sections") {
                let numSections = subject.numberOfSections(in: mockTableView)
                then("it should return static value of 1") {
                    XCTAssertEqual(numSections, 1)
                }
            }

            when("get number of rows for the section") {
                let numRows = subject.tableView(mockTableView, numberOfRowsInSection: 0)
                then("it should return static value of 26") {
                    XCTAssertEqual(numRows, 26)
                }
            }

            when("get cell for indexPath row 13") {
                let cell = subject.tableView(mockTableView, cellForRowAt: IndexPath(row: 13, section: 0))
                then("it should have text label matching row number") {
                    XCTAssertEqual(cell.textLabel?.text, "Item 13")
                }
            }

            when("selecting any row (row 8)") {
                subject.tableView(mockTableView, didSelectRowAt: IndexPath(row: 8, section: 0))
                then("it should properly inform the delegate") {
                    XCTAssertTrue(mockDelegate.wasCalled_didSelect)
                    XCTAssertEqual(mockDelegate.valueFor_didSelect_id, 8)
                    XCTAssert(mockDelegate.valueFor_didSelect_manager === subject)
                }
            }
        }
    }
}

extension ToDoTableViewManagerTests {

    class MockToDoTableViewManagerDelegate: ToDoTableViewManagerDelegate {

        var wasCalled_didSelect: Bool = false
        var valueFor_didSelect_manager: ToDoTableViewManager? = nil
        var valueFor_didSelect_id: Int = -1

        func toDoTableViewManager(_ manager: ToDoTableViewManager, didSelectId id: Int) {
            wasCalled_didSelect = true
            valueFor_didSelect_manager = manager
            valueFor_didSelect_id = id
        }
    }

}
