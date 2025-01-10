import Foundation

struct MealEntryDTO: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strIngredients: String?
}

struct MealResponseDTO: Decodable {
    let meals: [MealEntryDTO]?
}
