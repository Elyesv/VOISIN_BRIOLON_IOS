import SwiftUI
import CoreData

struct MealDetailView: View {
    let meal: Meal
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        entity: WeekMeal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WeekMeal.name, ascending: true)]
    )
    var weekMeals: FetchedResults<WeekMeal>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image
                AsyncImage(url: URL(string: meal.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                }
                .cornerRadius(8)

                Text(meal.name)
                    .font(.title)
                    .fontWeight(.bold)

                HStack {
                    Text(meal.category)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)

                    Text(meal.area)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }

                Button(action: {
                    toggleWeekMeal()
                }) {
                    HStack {
                        Image(systemName: isFavorite ? "checkmark.circle.fill" : "plus.circle")
                        Text(isFavorite ? "Added to Week Meals" : "Add to Week Meals")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isFavorite ? Color.green : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }

                // Instructions
                Text(meal.instructions)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var isFavorite: Bool {
        weekMeals.contains { $0.id == meal.id }
    }

    private func toggleWeekMeal() {
        let context = CoreDataManager.shared.context

        if isFavorite {
            if let toDelete = weekMeals.first(where: { $0.id == meal.id }) {
                context.delete(toDelete)
            }
        } else {
            let weekMeal = WeekMeal(context: context)
            weekMeal.id = meal.id
            weekMeal.name = meal.name
            weekMeal.imageUrl = meal.imageUrl
            weekMeal.ingredients = meal.ingredients
        }
        
        CoreDataManager.shared.save()
    }
}
