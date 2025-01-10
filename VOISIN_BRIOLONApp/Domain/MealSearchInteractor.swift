import Foundation

protocol MealSearchInteractor {
    func searchMeals(query: String) async throws -> [Meal]
}
