//
//  ControlWidgetsControl.swift
//  ControlWidgets
//
//  Created by Tom Hamming on 9/17/24.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ControlWidgetsControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.olivetree.ControlWidgetTester.ControlWidgets",
            provider: Provider()
        ) { value in
            ControlWidgetToggle(
                "Start Timer",
                isOn: value,
                action: StartTimerIntent()
            ) { isRunning in
                Label(isRunning ? "On" : "Off", systemImage: "timer")
            }
        }
        .displayName("Timer")
        .description("A an example control that runs a timer.")
    }
}

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

extension ControlWidgetsControl {
    struct Provider: ControlValueProvider {
        var previewValue: Bool {
            false
        }

        func currentValue() async throws -> Bool {
            let isRunning = true // Check if the timer is running
            return isRunning
        }
    }
}

struct StartTimerIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Start a timer"

    @Parameter(title: "Timer is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        // Start / stop the timer based on `value`.
        return .result()
    }
}
