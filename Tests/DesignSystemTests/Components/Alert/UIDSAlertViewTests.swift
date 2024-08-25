import SnapshotTesting
import XCTest

@testable import DesignSystem

final class UIDSAlertViewTests: XCTestCase {

    func testSnapshots() {

            for kind in AlertKind.allCases {
                let alertView = UIDSAlertView(kind: kind, message: "Message")
                alertView.widthAnchor.constraint(equalToConstant: 375).isActive = true
                assertSnapshot(of: alertView, as: .image)
            }
    }
}
