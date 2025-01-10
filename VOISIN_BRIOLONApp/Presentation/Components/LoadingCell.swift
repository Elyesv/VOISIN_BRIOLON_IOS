import SwiftUI

struct LoadingCell: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(width: 80, height: 80)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(height: 20)
                    .cornerRadius(4)

                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(height: 16)
                    .cornerRadius(4)

                HStack {
                    ForEach(0..<2) { _ in
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(width: 50, height: 16)
                            .cornerRadius(4)
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoadingCell()
}
