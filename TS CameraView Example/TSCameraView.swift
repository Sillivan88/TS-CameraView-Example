//
//  TSCameraView.swift
//  TS CameraView Example
//
//  Created by Thomas Sillmann on 21.01.22.
//

import SwiftUI
import UniformTypeIdentifiers

struct TSCameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.mediaTypes = [UTType.image.identifier]
        imagePickerController.sourceType = .camera
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
