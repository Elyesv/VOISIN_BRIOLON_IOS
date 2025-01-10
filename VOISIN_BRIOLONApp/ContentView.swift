import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SearchView(mealSearchInteractor: MealSearchInteractorImplementation(
                mealRepository: MealRepositoryImplementation(
                    dataSource: MealDataSource(),
                    mapper: MealMapper()
                )
            ))
        }
    }
}

#Preview {
    ContentView()
}
