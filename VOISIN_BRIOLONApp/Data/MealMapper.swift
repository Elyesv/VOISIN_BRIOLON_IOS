import Foundation

class MealMapper {
    func mapMealResponseToDomain(responseDTO: MealResponseDTO) -> [Meal] {
        return responseDTO.meals.map { mealDTO in
            Meal(
                id: mealDTO.idMeal,
                name: mealDTO.strMeal,
                imageUrl: mealDTO.strMealThumb,
                category: mealDTO.strCategory ?? "",
                area: mealDTO.strArea ?? "",
                instructions: mealDTO.strInstructions ?? "",
                ingredients: mealDTO.strIngredients ?? ""
            )
        }
    }
}

