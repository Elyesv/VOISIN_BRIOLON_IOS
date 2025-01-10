import Foundation

class MealMapper {
    static func mapMealResponseToDomain(input: MealEntryDTO) -> Meal {
        return Meal(
            id: input.idMeal ?? UUID().uuidString,
            name: input.strMeal ?? "Inconnu",
            imageUrl: input.strMealThumb ?? "",
            category: input.strCategory ?? "Non classé"
        )
    }
}
