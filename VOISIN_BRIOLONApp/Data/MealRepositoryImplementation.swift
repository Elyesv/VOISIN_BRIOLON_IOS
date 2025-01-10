import Foundation

class MealRepositoryImplementation: MealRepository {
    private let dataSource: MealDataSource
    private let mapper: MealMapper

    init(dataSource: MealDataSource, mapper: MealMapper) {
        self.dataSource = dataSource
        self.mapper = mapper
    }

    func searchMeals(query: String) async throws -> [Meal] {
        let dto = try await dataSource.searchMeals(query: query)
        return mapper.mapMealResponseToDomain(responseDTO: dto)
    }
}
