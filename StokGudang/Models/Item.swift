import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID = UUID()
    var name: String
    var sku: String
    var category: String
    var quantity: Int
    var price: Double
    var minStock: Int
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
    @Relationship(deleteRule: .cascade) var transactions: [Transaction] = []
    
    init(name: String, sku: String, category: String, quantity: Int, price: Double, minStock: Int) {
        self.name = name
        self.sku = sku
        self.category = category
        self.quantity = quantity
        self.price = price
        self.minStock = minStock
    }
    
    var isLowStock: Bool {
        quantity < minStock
    }
}
