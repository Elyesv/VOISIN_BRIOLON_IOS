import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel

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
