//
//  LogEntryAppIntent.swift
//  WidgetExtentionExtension
//
//  Created by Peyman on 3/22/25.
//

import Foundation
import AppIntents

struct LogEntryAppIntent: AppIntent {
    static var title: LocalizedStringResource = " log an entry to your streak."
        
    static var description = IntentDescription("add 1 to your streak.")
    
    func perform() async throws -> some IntentResult {
        let data = DataService()
        data.log()
        
        return .result(value: data.progress())
    }
}
