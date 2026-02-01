import SwiftUI

struct FiltersView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory = "all"
    @State private var maxPrice = ""
    @State private var minPrice = ""
    @State private var location = ""
    @State private var radius = 25.0
    let onApply: (String) -> Void
    
    let categories = [
        ("all", "All Categories"),
        ("vehicles", "Vehicles"),
        ("propertyrentals", "Property Rentals"),
        ("electronics", "Electronics"),
        ("furniture", "Furniture"),
        ("hobbies", "Hobbies"),
        ("homegarden", "Home & Garden"),
        ("classifieds", "Classifieds")
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.0) { category in
                            Text(category.1).tag(category.0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Price Range")) {
                    HStack {
                        Text("Min")
                        Spacer()
                        TextField("$0", text: $minPrice)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Text("Max")
                        Spacer()
                        TextField("Any", text: $maxPrice)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100)
                    }
                }
                
                Section(header: Text("Location")) {
                    TextField("City or ZIP code", text: $location)
                    
                    VStack(alignment: .leading) {
                        Text("Radius: \(Int(radius)) miles")
                            .font(.subheadline)
                        Slider(value: $radius, in: 1...100, step: 1)
                    }
                }
                
                Section {
                    Button("Apply Filters") {
                        applyFilters()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.blue)
                    
                    Button("Clear All") {
                        clearFilters()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func applyFilters() {
        var urlString = "https://www.facebook.com/marketplace"
        
        if selectedCategory != "all" {
            urlString += "/category/\(selectedCategory)"
        }
        
        // Note: Facebook Marketplace URL parameters may vary
        // This is a simplified version
        var params: [String] = []
        
        if !minPrice.isEmpty {
            params.append("minPrice=\(minPrice)")
        }
        
        if !maxPrice.isEmpty {
            params.append("maxPrice=\(maxPrice)")
        }
        
        if !params.isEmpty {
            urlString += "?" + params.joined(separator: "&")
        }
        
        onApply(urlString)
    }
    
    private func clearFilters() {
        selectedCategory = "all"
        maxPrice = ""
        minPrice = ""
        location = ""
        radius = 25.0
    }
}
