import Foundation
import Combine
import SwiftUI

class SavedSearchManager: ObservableObject {
    @Published var savedSearches: [SavedSearch] = []
    
    private let userDefaultsKey = "savedSearches"
    
    init() {
        loadSearches()
    }
    
    func addSearch(name: String, url: String) {
        let newSearch = SavedSearch(id: UUID(), name: name, url: url, createdDate: Date())
        savedSearches.append(newSearch)
        saveSearches()
    }
    
    func deleteSearch(at indexSet: IndexSet) {
        savedSearches.remove(atOffsets: indexSet)
        saveSearches()
    }
    
    func deleteSearch(id: UUID) {
        savedSearches.removeAll { $0.id == id }
        saveSearches()
    }
    
    private func saveSearches() {
        if let encoded = try? JSONEncoder().encode(savedSearches) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadSearches() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([SavedSearch].self, from: data) {
            savedSearches = decoded
        }
    }
}

struct SavedSearch: Identifiable, Codable {
    let id: UUID
    let name: String
    let url: String
    let createdDate: Date
}
