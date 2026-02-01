import SwiftUI

struct SavedSearchesView: View {
    @EnvironmentObject var savedSearchManager: SavedSearchManager
    @Environment(\.dismiss) var dismiss
    @State private var showAddSearch = false
    @State private var newSearchName = ""
    @State private var newSearchURL = ""
    let onSearchSelected: (String) -> Void
    
    var body: some View {
        NavigationView {
            List {
                ForEach(savedSearchManager.savedSearches) { search in
                    Button(action: {
                        onSearchSelected(search.url)
                    }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(search.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(search.url)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                            Text(search.createdDate, style: .date)
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: savedSearchManager.deleteSearch)
            }
            .navigationTitle("Saved Searches")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddSearch = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSearch) {
                AddSearchView(onSave: { name, url in
                    savedSearchManager.addSearch(name: name, url: url)
                    showAddSearch = false
                })
            }
            .overlay {
                if savedSearchManager.savedSearches.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("No Saved Searches")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Save your favorite searches for quick access")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }
        }
    }
}

struct AddSearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchName = ""
    @State private var searchURL = "https://www.facebook.com/marketplace"
    let onSave: (String, String) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Search Details")) {
                    TextField("Search Name", text: $searchName)
                    TextField("URL", text: $searchURL)
                        .autocapitalization(.none)
                        .keyboardType(.URL)
                }
                
                Section(header: Text("Quick Links")) {
                    Button("All Marketplace") {
                        searchURL = "https://www.facebook.com/marketplace"
                    }
                    Button("Vehicles") {
                        searchURL = "https://www.facebook.com/marketplace/category/vehicles"
                    }
                    Button("Property Rentals") {
                        searchURL = "https://www.facebook.com/marketplace/category/propertyrentals"
                    }
                }
            }
            .navigationTitle("Add Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !searchName.isEmpty && !searchURL.isEmpty {
                            onSave(searchName, searchURL)
                        }
                    }
                    .disabled(searchName.isEmpty || searchURL.isEmpty)
                }
            }
        }
    }
}
