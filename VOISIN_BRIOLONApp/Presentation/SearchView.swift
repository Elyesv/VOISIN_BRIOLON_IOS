import SwiftUI

struct SearchView: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel: SearchViewModel
    
    @FetchRequest(
        entity: WeekMeal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WeekMeal.name, ascending: true)]
    )
    var weekMeals: FetchedResults<WeekMeal>

    init(mealSearchInteractor: MealSearchInteractor) {
        _viewModel = StateObject(wrappedValue: SearchViewModel(mealSearchInteractor: mealSearchInteractor))
    }

    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchText: $viewModel.searchText, onSearch: {
                    Task {
                        await viewModel.searchMeals(query: viewModel.searchText)
                    }
                })
                
                Text("Number of meals: \(weekMeals.count)")
                    .font(.headline)
                    .padding()

                if viewModel.isLoading {
                    ForEach(0..<3, id: \.self) { _ in
                        LoadingCell()
                    }
                } else {
                    List(viewModel.meals) { meal in
                        MealCell(meal: meal)
                    }
                }
                
                
            }
        }
        .navigationTitle("Rechercher")
    }
}
