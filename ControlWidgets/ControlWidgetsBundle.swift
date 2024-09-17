//
//  ControlWidgetsBundle.swift
//  ControlWidgets
//
//  Created by Tom Hamming on 9/17/24.
//

import WidgetKit
import SwiftUI

@main
struct ControlWidgetsBundle: WidgetBundle {
    var body: some Widget {
        ControlWidgets()
        ControlWidgetsControl()
        LaunchAppControl()
    }
}
