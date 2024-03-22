//
//  VisionOS_AnchorSampleApp.swift
//  VisionOS-AnchorSample
//
//  Created by Sadao Tokuyama on 3/22/24.
//

import SwiftUI

@main
struct VisionOS_AnchorSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
