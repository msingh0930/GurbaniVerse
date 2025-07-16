import WidgetKit
import SwiftUI

struct GurmukhiVerseWidgetEntryView: View {
    var entry: VerseProvider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.verse.gurmukhi)
                .font(.headline)
            Text(entry.verse.transliteration)
                .font(.subheadline)
            Text(entry.verse.translation)
                .font(.footnote)
        }
        .padding()
        .containerBackground(for: .widget) {
            Color.clear
        }
    }
}

@main
struct GurmukhiVerseWidget: Widget {
    let kind: String = "GurmukhiVerseWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VerseProvider()) { entry in
            GurmukhiVerseWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Daily Gurmukhi Verse")
        .description("Displays a random verse from the Guru Granth Sahib.")
    }
}

