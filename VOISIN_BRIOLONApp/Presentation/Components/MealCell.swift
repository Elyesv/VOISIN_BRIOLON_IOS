import SwiftUI

struct MealCell: View {
    let meal: Meal

    var body: some View {
        NavigationLink(destination: MealDetailView(meal: meal)) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: meal.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 100)
                }
                .cornerRadius(8)

                Text(meal.name)
                    .font(.headline)
                    .lineLimit(1)

                HStack {
                    Text(meal.category)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    Text(meal.area)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
