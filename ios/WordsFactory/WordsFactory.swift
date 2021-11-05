//
//  WordsFactory.swift
//  WordsFactory
//
//  Created by Alexey Shvedchikov on 05.11.2021.
//

import WidgetKit
import SwiftUI
import Intents
import simd

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(count: 322,date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults().value(forKey: "size") as? Int
        let entry = SimpleEntry(count: data ?? 422,date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
 
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(count: 322,date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let count: Int
    let date: Date
    let configuration: ConfigurationIntent
}

struct WordsFactoryEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
            Spacer()
            Text("WordsFactory")
            Spacer()
            HStack{
                Text("My Dictionary: ")
                Spacer()
                Text("\(entry.count)")
            }
            
            Spacer()
        }.padding(10)
    }
}

@main
struct WordsFactory: Widget {
    let kind: String = "WordsFactory"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider() ) { entry in
            WordsFactoryEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WordsFactory_Previews: PreviewProvider {
    static var previews: some View {
        WordsFactoryEntryView(entry: SimpleEntry(count: 322, date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
