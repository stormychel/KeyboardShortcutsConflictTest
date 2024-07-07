//
//  ContentView.swift
//  KeyboardShortcutsConflictTest
//
//  Created by Michel Storms on 07/07/2024.
//

import SwiftUI
import KeyboardShortcuts

struct ContentView: View {
    let appState = AppState()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Form {
                KeyboardShortcuts.Recorder("Toggle Unicorn Mode:", name: .toggleUnicornMode)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension KeyboardShortcuts.Name {
    static let toggleUnicornMode = Self("toggleUnicornMode")
}

@MainActor
final class AppState: ObservableObject {
    init() {
        KeyboardShortcuts.onKeyUp(for: .toggleUnicornMode) { [self] in
            print("keyUp")
        }
    }
}
