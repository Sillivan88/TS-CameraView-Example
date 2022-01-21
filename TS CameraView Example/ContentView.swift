//
//  ContentView.swift
//  TS CameraView Example
//
//  Created by Thomas Sillmann on 21.01.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showCameraView = false
    
    var body: some View {
        Button("Show camera") {
            showCameraView = true
        }
        .sheet(isPresented: $showCameraView) {
            TSCameraView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
