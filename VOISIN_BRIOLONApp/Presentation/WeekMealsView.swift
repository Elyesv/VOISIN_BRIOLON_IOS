import SwiftUI
import CoreData

struct WeekMealView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: WeekMeal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WeekMeal.name, ascending: true)]
    )
    var weekMeals: FetchedResults<WeekMeal>

    var body: some View {
        
        
        NavigationView {
            
            Text("Number of meals: \(weekMeals.count)")
                .font(.headline)
                .padding()
            
            if weekMeals.isEmpty {
                Text("No meals for this week.")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(weekMeals) { weekMeal in
                        HStack {
                            if let imageUrl = weekMeal.imageUrl, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 60, height: 60)
                                }
                            }

                            VStack(alignment: .leading) {
                                Text(weekMeal.name ?? "Unknown Meal")
                                    .font(.headline)
                                if let ingredients = weekMeal.ingredients {
                                    Text(ingredients)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteMeal)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Week Meals")
            }
        }
    }

    private func deleteMeal(at offsets: IndexSet) {
        let context = CoreDataManager.shared.context
        offsets.forEach { index in
            let meal = weekMeals[index]
            context.delete(meal)
        }
        CoreDataManager.shared.save()
    }
}
