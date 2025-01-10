import SwiftUI

class SearchViewModel: ObservableObject {
    private let mealSearchInteractor: MealSearchInteractor
    @Published var searchText: String = ""
    @Published var meals: [Meal] = []
    @Published var isLoading: Bool = false

    init(mealSearchInteractor: MealSearchInteractor) {
        self.mealSearchInteractor = mealSearchInteractor
    }

    func searchMeals(query: String) async {
        isLoading = true
        do {
            let result = try await mealSearchInteractor.searchMeals(query: query)
            self.meals = result
            self.isLoading = false
        } catch {
            self.isLoading = false
            print("Error searching meals: \(error)")
        }
    }
}
