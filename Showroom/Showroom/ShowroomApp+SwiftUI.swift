import SwiftUI
import DesignSystem

@main
struct ShowroomApp: App {

    var body: some Scene {
        WindowGroup {
            Text("SwiftUI")
                .font(.title)
                .padding(.bottom, 8)
            Text("Alerts")
                .font(.title2)
                .padding(.bottom, 8)
            VStack {
                ForEach(AlertKind.allCases, id: \.self) { alertKind in
                    DSAlertView(kind: alertKind, message: "Alert message")
                        .padding(.bottom, 8)
                }
            }.padding()
        }
    }
}
