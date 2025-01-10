import Foundation

class MealRepositoryImplementation: MealRepository {
    private let mealDataSource: MealDataSource

    init(mealDataSource: MealDataSource) {
        self.mealDataSource = mealDataSource
    }

    func searchMeals(query: String) async throws -> [Meal] {
        guard let responseDTO = try await mealDataSource.searchMeals(query: query).meals else {
            return [] // Retourne un tableau vide si aucune donnée
        }
        return responseDTO.map { MealMapper.mapMealResponseToDomain(input: $0) }
    }
}
