import Foundation

class MealDataSource {
    func searchMeals(query: String) async throws -> MealResponseDTO {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MealResponseDTO.self, from: data)
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
