import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    @EnvironmentObject var savedSearchManager: SavedSearchManager
    @State private var showSettings = false
    @State private var showSavedSearches = false
    @State private var showFilters = false
    @State private var currentURL = "https://www.facebook.com/marketplace"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Toolbar
                CustomToolbar(
                    showSettings: $showSettings,
                    showSavedSearches: $showSavedSearches,
                    showFilters: $showFilters
                )
                
                // WebView
                MarketplaceWebView(url: $currentURL)
                
                // Bottom Quick Filters Bar
                QuickFiltersBar(onFilterSelected: { filter in
                    applyFilter(filter)
                })
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .sheet(isPresented: $showSavedSearches) {
                SavedSearchesView(onSearchSelected: { url in
                    currentURL = url
                    showSavedSearches = false
                })
            }
            .sheet(isPresented: $showFilters) {
                FiltersView(onApply: { filterURL in
                    currentURL = filterURL
                    showFilters = false
                })
            }
        }
    }
    
    private func applyFilter(_ filter: QuickFilter) {
        switch filter {
        case .all:
            currentURL = "https://www.facebook.com/marketplace"
        case .baby:
            currentURL = "https://www.facebook.com/marketplace/category/family"
        case .clothing:
            currentURL = "https://www.facebook.com/marketplace/category/apparel"
        case .electronics:
            currentURL = "https://www.facebook.com/marketplace/category/electronics"
        case .entertainment:
            currentURL = "https://wwww.facebook.com/marketplace/category/entertainment"
        case .free:
            currentURL = "https://www.facebook.com/marketplace/category/?free=true"
        case .furniture:
            currentURL = "https://www.facebook.com/marketplace/category/furniture"
        case .hobbies:
            currentURL = "https://www.facebook.com/marketplace/category/hobbies"
        case .property:
            currentURL = "https://www.facebook.com/marketplace/category/propertyrentals"
        case .vehicles:
            currentURL = "https://www.facebook.com/marketplace/category/vehicles"
        }
    }
}

enum QuickFilter {
    case all, baby, clothing, electronics, entertainment, free, furniture, hobbies, property, vehicles
}
