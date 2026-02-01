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
        case .vehicles:
            currentURL = "https://www.facebook.com/marketplace/category/vehicles"
        case .property:
            currentURL = "https://www.facebook.com/marketplace/category/propertyrentals"
        case .electronics:
            currentURL = "https://www.facebook.com/marketplace/category/electronics"
        case .furniture:
            currentURL = "https://www.facebook.com/marketplace/category/furniture"
        }
    }
}

enum QuickFilter {
    case all, vehicles, property, electronics, furniture
}
