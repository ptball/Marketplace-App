import SwiftUI

@main
struct MarketplaceViewerApp: App {
    @StateObject private var notificationManager = NotificationManager()
    @StateObject private var savedSearchManager = SavedSearchManager()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
                .environmentObject(savedSearchManager)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
