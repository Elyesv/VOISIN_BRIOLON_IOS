import SwiftUI

struct MealCell: View {
    let meal: Meal

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                Rectangle()
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(meal.name)
                    .font(.headline)
                Text(meal.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        
            .padding(.leading, 8)
        }
        .padding(.vertical, 4)
    }
}
