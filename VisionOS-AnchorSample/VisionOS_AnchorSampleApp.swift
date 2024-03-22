//
//  VisionOS_AnchorSampleApp.swift
//  VisionOS-AnchorSample
//
//  Created by Sadao Tokuyama on 3/22/24.
//

import SwiftUI
import RealityKit

@main
struct VisionOS_AnchorSampleApp: App {
    var body: some SwiftUI.Scene {
        
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            RealityView { content in
                let wallAnchor = AnchorEntity(.plane(.vertical, classification: .wall, minimumBounds: [1,1]))
                content.add(wallAnchor)
                
                let cellAnchor = AnchorEntity(.plane(.horizontal, classification: .ceiling, minimumBounds: [1,1]))
                content.add(cellAnchor)
                            
                let floorAnchor = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds: [1,1]))
                content.add(floorAnchor)
                
                if let entity = try? await Entity(named: "tv_retro") {
                    let radians = -90 * Float.pi / 180.0
                    entity.transform.rotation = simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))
                    entity.scale = [0.01, 0.01, 0.01]
                    wallAnchor.addChild(entity)
                }
                
                if let entity = try? await Entity(named: "toy_car") {
                    let radians = -90 * Float.pi / 180.0
                    entity.transform.rotation = simd_quatf(angle: radians, axis: SIMD3<Float>(0,1,0))
                    entity.scale = [0.04, 0.04, 0.04]
                    cellAnchor.addChild(entity)
                }
                
                if let entity = try? await Entity(named: "toy_drummer_idle") {
                    entity.scale = [0.05, 0.05, 0.05]
                    floorAnchor.addChild(entity)
                }
            }
        }
    }
}
