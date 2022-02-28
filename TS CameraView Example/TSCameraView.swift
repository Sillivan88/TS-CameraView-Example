//
//  TSCameraView.swift
//  TS CameraView Example
//
//  Created by Thomas Sillmann on 21.01.22.
//

import SwiftUI
import UniformTypeIdentifiers

struct TSCameraView: UIViewControllerRepresentable {
    static var canCaptureImages: Bool {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return false
        }
        if let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .camera), availableMediaTypes.contains(UTType.image.identifier) {
            return true
        }
        return false
    }
    
    @Binding var photo: UIImage?
    
    @Binding var showsCameraView: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.mediaTypes = [UTType.image.identifier]
        imagePickerController.sourceType = .camera
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: TSCameraView
        
        init(_ cameraView: TSCameraView) {
            parent = cameraView
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.photo = image
            }
            parent.showsCameraView = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showsCameraView = false
        }
    }
}
