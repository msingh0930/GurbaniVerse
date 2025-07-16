import SwiftUI

struct ContentView: View {
    let verses: [Verse] = Bundle.main.decode("verses.json")

    var todaysVerse: Verse {
        let date = Date()
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date) ?? 1
        let index = dayOfYear % verses.count
        return verses[index]
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(todaysVerse.gurmukhi)
                    .font(.title)
                    .multilineTextAlignment(.center)

                Text(todaysVerse.transliteration)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)

                Text(todaysVerse.translation)
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                NavigationLink("Read Full Guru Granth Sahib") {
                    FullGranthSahib()
                }
                NavigationLink("Read Full Guru Granth Sahib In English") {
                    FullGranthSahibEnglish()
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Quote of the Day")
        }
    }
}
