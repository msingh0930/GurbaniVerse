import WidgetKit
import SwiftUI

struct VerseProvider: TimelineProvider {
    let verses: [Verse] = Bundle.main.decode("verses.json")

    func placeholder(in context: Context) -> VerseEntry {
        VerseEntry(date: Date(), verse: verses.first!)
    }

    func getSnapshot(in context: Context, completion: @escaping (VerseEntry) -> Void) {
        let entry = VerseEntry(date: Date(), verse: verses.first!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<VerseEntry>) -> Void) {
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: Date()) ?? 1
        let index = dayOfYear % verses.count
        let verseOfTheDay = verses[index]

        let entry = VerseEntry(date: Date(), verse: verseOfTheDay)

        let nextUpdate = calendar.nextDate(after: Date(), matching: DateComponents(hour: 0), matchingPolicy: .nextTime)!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))

        completion(timeline)
    }
}
