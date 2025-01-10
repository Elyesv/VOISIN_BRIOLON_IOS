import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView(mealSearchInteractor: MealSearchInteractorImplementation(
                mealRepository: MealRepositoryImplementation(
                    mealDataSource: MealDataSource()
                )
            ))
                .tabItem {
                    Label("Meal List", systemImage: "list.bullet")
                }
            WeekMealView()
               .tabItem {
                   Label("Week Meals", systemImage: "cart")
               }
        }
    }
}

#Preview {
    ContentView()
}
