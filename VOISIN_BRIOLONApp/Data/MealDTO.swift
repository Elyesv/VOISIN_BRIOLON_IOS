import Foundation

struct MealEntryDTO: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
    let strCategory: String?
}

struct MealResponseDTO: Decodable {
    let meals: [MealEntryDTO]?
}
