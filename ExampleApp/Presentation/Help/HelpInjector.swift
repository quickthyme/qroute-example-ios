
import UIKit
import QTRoute

class HelpInjector: NSObject {
    @IBOutlet weak var viewController: HelpViewController!

    private struct SegueId {
        static let ToContactUs = "ToContactUs"
        static let ToMessageCenter = "ToMessageCenter"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        viewController.routeResolver = QTRouteResolver(
            AppRoute.plan.findDescendant(AppRoute.id.Help)!,

            toChild: QTRouteResolver.DefaultAction.ToChildKeyed([
                AppRoute.id.ContactUs: ToChildSegueResolverAction(segueId: SegueId.ToContactUs),
                AppRoute.id.MessageCenter: ToChildSegueResolverAction(segueId: SegueId.ToMessageCenter)
                ]),

            toParent: ToParentAppRouteRootResolverAction()
        )
        viewController.routeDriver = AppRoute.driver
    }
}
