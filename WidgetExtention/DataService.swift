//
//  DataService.swift
//  WidgetExtentionExtension
//
//  Created by Peyman on 3/22/25.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage("streak" , store: UserDefaults(suiteName: "group.com.widgetDemo")) private  var  streak = 0

    func log ()
    {
        streak += 1
    }
    
    func progress () -> Int{
        return streak
    }
}
