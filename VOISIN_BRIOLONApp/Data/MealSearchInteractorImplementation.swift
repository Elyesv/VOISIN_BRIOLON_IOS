import Foundation

class MealSearchInteractorImplementation: MealSearchInteractor {
    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func searchMeals(query: String) async throws -> [Meal] {
        return try await mealRepository.searchMeals(query: query)
    }
}
