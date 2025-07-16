import SwiftUI

struct FullGranthSahibEnglish: View {
    let lines: [String] = Bundle.main.decode("guru_granth_sahib_english.json")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(lines, id: \.self) { line in
                    Text(line)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
        }
        .navigationTitle("Guru Granth Sahib In English")
    }
}
