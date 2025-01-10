import Foundation

protocol MealRepository {
    func searchMeals(query: String) async throws -> [Meal]
}
