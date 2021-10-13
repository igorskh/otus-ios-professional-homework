//
//  SuffixStatsWidget.swift
//  SuffixStatsWidget
//
//  Created by Igor Kim on 03.10.21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(configuration: ConfigurationIntent(), loadedCount: [])
    }
    
    func readFromUserDefaults() -> [SuffixCount]? {
        if let savedCount = UserDefaults(suiteName: "group.one.beagile.otus-homework")?.object(forKey: "count") as? Data {
            let decoder = JSONDecoder()
            if let loadedCount = try? decoder.decode([SuffixCount].self, from: savedCount) {
                return loadedCount
            }
        }
        return nil
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        var entry: SimpleEntry = .init(configuration: configuration, loadedCount: [])
        
        if let savedCount = readFromUserDefaults() {
            entry = SimpleEntry(configuration: configuration, loadedCount: savedCount)
        }
        
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        if let savedCount = readFromUserDefaults() {
            entries = [SimpleEntry(configuration: configuration, loadedCount: savedCount)]
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date = .init()
    let configuration: ConfigurationIntent
    let loadedCount: [SuffixCount]
}

struct SuffixStatsWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            ForEach(entry.loadedCount, id: \.self.suffix) { s in
                HStack {
                    Text(s.suffix)
                    Spacer()
                    Text("\(s.count)")
                }
            }
            .widgetURL(URL(string: "stats")!)
            
            Spacer()
            
            HStack {
                Link(destination: URL(string: "add")!, label:{ Text("Add word")})
                Spacer()
                Link(destination: URL(string: "stats")!, label:{ Text("Statistics")})
            }
            
        }
        .padding()
    }
}

@main
struct SuffixStatsWidget: Widget {
    let kind: String = "SuffixStatsWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SuffixStatsWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemExtraLarge, .systemLarge, .systemMedium])
        .configurationDisplayName("Suffix Counter Widget")
        .description("Show words suffix statistics")
    }
}
