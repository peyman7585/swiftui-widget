//
//  WidgetExtention.swift
//  WidgetExtention
//
//  Created by Peyman on 3/22/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), streak: data.progress())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), streak: data.progress())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, streak: data.progress())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let streak: Int
}

struct WidgetExtentionEntryView : View {
    var entry: Provider.Entry
    let data = DataService()
    var body: some View {
      
            ZStack{
              
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 20)
                        
                    let pct = Double(data.progress())/50.0
                    Circle()
                        .trim(from: 0,to: pct)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round ))
                        .rotationEffect(.init(degrees: -90))
                        
                    VStack{
                       
                        Text(String(data.progress()))
                            .font(.title)
                            .bold()
                    }
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    
                }
            .containerBackground(.black, for: .widget)
            .padding()
            
           
            
     
        
        
    }
}

struct WidgetExtention: Widget {
    let kind: String = "WidgetExtention"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetExtentionEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetExtentionEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    WidgetExtention()
} timeline: {
    SimpleEntry(date: .now, streak: 1)
    SimpleEntry(date: .now, streak: 2)
}
