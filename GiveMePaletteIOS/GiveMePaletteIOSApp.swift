//
//  GiveMePaletteIOSApp.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 08/11/23.
//

import SwiftUI

@main
struct GiveMePaletteIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppMainView()
        }
    }
}
