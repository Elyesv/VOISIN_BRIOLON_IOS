import SwiftUI

struct MealDetailView: View {
    let meal: Meal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image de la recette
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

                // Nom de la recette
                Text(meal.name)
                    .font(.title)
                    .fontWeight(.bold)

                // Catégories et nationalité
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
}
