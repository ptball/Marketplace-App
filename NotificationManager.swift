import Foundation
import UserNotifications
import Combine

class NotificationManager: NSObject, ObservableObject {
    @Published var notificationsEnabled = false
    @Published var notificationFrequency: NotificationFrequency = .hourly
    
    override init() {
        super.init()
        checkNotificationStatus()
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                self.notificationsEnabled = granted
                if granted {
                    self.scheduleNotifications()
                }
            }
        }
    }
    
    func checkNotificationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }
    
    func scheduleNotifications() {
        // Remove existing notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        guard notificationsEnabled else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "New Marketplace Listings"
        content.body = "Check out the latest items in your area!"
        content.sound = .default
        
        var trigger: UNNotificationTrigger
        
        switch notificationFrequency {
        case .hourly:
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
        case .daily:
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            dateComponents.minute = 0
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        case .weekly:
            var dateComponents = DateComponents()
            dateComponents.weekday = 2 // Monday
            dateComponents.hour = 9
            dateComponents.minute = 0
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        case .never:
            return
        }
        
        let request = UNNotificationRequest(identifier: "marketplace-update", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func disableNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        notificationsEnabled = false
    }
}

enum NotificationFrequency: String, CaseIterable, Identifiable {
    case never = "Never"
    case hourly = "Hourly"
    case daily = "Daily"
    case weekly = "Weekly"
    
    var id: String { self.rawValue }
}
