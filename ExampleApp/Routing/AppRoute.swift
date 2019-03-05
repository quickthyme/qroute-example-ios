
import QRoute

class AppRoute {

    struct id {
        static let Root = "Root"
        static let ToDo = "ToDo"
        static let ToDoDetail = "ToDoDetail"
        static let Help = "Help"
        static let ContactUs = "ContactUs"
        static let MessageCenter = "MessageCenter"
    }

    static var plan: QRoute =
        QRoute(id.Root,
                QRoute(id.ToDo,
                        QRoute(id.ToDoDetail,
                                dependencies: ["toDoId"])),
                QRoute(id.Help,
                        QRoute(id.ContactUs),
                        QRoute(id.MessageCenter)))

    static var driver: QRouteDriving? = QRouteDriver()

    static weak var rootRoutable: RootViewController? = nil
}
