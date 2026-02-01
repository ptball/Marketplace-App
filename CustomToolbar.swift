import SwiftUI
import UIKit

struct CustomToolbar: View {
    @Binding var showSettings: Bool
    @Binding var showSavedSearches: Bool
    @Binding var showFilters: Bool
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        HStack {
            // Logo/Title
            HStack(spacing: 8) {
                Image(systemName: "cart.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                Text("Marketplace")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            // Toolbar buttons
            HStack(spacing: 16) {
                Button(action: { showSavedSearches.toggle() }) {
                    Image(systemName: "bookmark.fill")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
                
                Button(action: { showFilters.toggle() }) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
                
                Button(action: { showSettings.toggle() }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(isDarkMode ? Color(UIColor.systemGray6) : Color(UIColor.systemBackground))
        .shadow(color: Color.black.opacity(0.1), radius: 2, y: 2)
    }
}
