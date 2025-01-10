import Foundation

class MealDataSource {
    func searchMeals(query: String) async throws -> MealResponseDTO {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(MealResponseDTO.self, from: data)
    }
}
