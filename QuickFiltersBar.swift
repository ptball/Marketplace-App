import SwiftUI

struct QuickFiltersBar: View {
    let onFilterSelected: (QuickFilter) -> Void
    @State private var selectedFilter: QuickFilter = .all
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                FilterButton(title: "All", icon: "square.grid.2x2", isSelected: selectedFilter == .all) {
                    selectedFilter = .all
                    onFilterSelected(.all)
                }
                
                FilterButton(title: "Vehicles", icon: "car.fill", isSelected: selectedFilter == .vehicles) {
                    selectedFilter = .vehicles
                    onFilterSelected(.vehicles)
                }
                
                FilterButton(title: "Property", icon: "house.fill", isSelected: selectedFilter == .property) {
                    selectedFilter = .property
                    onFilterSelected(.property)
                }
                
                FilterButton(title: "Electronics", icon: "laptopcomputer", isSelected: selectedFilter == .electronics) {
                    selectedFilter = .electronics
                    onFilterSelected(.electronics)
                }
                
                FilterButton(title: "Furniture", icon: "sofa.fill", isSelected: selectedFilter == .furniture) {
                    selectedFilter = .furniture
                    onFilterSelected(.furniture)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .background(isDarkMode ? Color(UIColor.systemGray6) : Color(UIColor.systemGray6).opacity(0.5))
    }
}

struct FilterButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.blue : Color(UIColor.systemGray5))
            .foregroundColor(isSelected ? .white : .primary)
            .cornerRadius(20)
        }
    }
}
