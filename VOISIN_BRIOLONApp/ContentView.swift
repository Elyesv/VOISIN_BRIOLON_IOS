import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SearchView(mealSearchInteractor: MealSearchInteractorImplementation(
                mealRepository: MealRepositoryImplementation(
                    mealDataSource: MealDataSource()
                )
            ))
        }
    }
}

#Preview {
    ContentView()
}
