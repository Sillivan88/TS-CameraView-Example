//
//  ContentView.swift
//  TS CameraView Example
//
//  Created by Thomas Sillmann on 21.01.22.
//

import SwiftUI

struct ContentView: View {
    @State private var photo: UIImage?
    
    @State private var showCameraView = false
    
    var body: some View {
        VStack {
            if let photo = self.photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            Button("Show camera") {
                showCameraView = true
            }
            .disabled(!TSCameraView.canCaptureImages)
        }
        .sheet(isPresented: $showCameraView) {
            TSCameraView(photo: $photo, showsCameraView: $showCameraView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
