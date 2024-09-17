//
//  ControlWidgetsControl.swift
//  ControlWidgets
//
//  Created by Tom Hamming on 9/17/24.
//

import AppIntents
import SwiftUI
import WidgetKit

struct LaunchAppControl : ControlWidget {
    var body : some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: "com.olivetree.ControlWidgetTester.LaunchAppControl") {
            ControlWidgetButton(action: LaunchAppIntent()) {
                Image(systemName: "book.pages")
            }
        }
        .displayName("Launch App")
    }
}

struct LaunchAppIntent: ControlConfigurationIntent {
    static let title: LocalizedStringResource = "Launch App"
    static let description = IntentDescription(stringLiteral: "Launch the app!")
    static let isDiscoverable = false
    
    static let openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult & OpensIntent {
        UserDefaults.standard.setValue("This text came from the control center widget!", forKey: "IntentAction")
        
        let url = URL(string: "otcontrolwidget://test")!
        return .result(opensIntent: OpenURLIntent(url))
    }
}
