//
//  ViewController.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 19.09.21.
//

import UIKit
import AVFoundation

// TODO: - Rename this class
// TODO: - Complete the class!!
class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    var video = AVCaptureVideoPreviewLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                let output = AVCaptureMetadataOutput()
                session.addInput(input)
                session.addOutput(output)
                
                output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                output.metadataObjectTypes = [.qr]
                video = AVCaptureVideoPreviewLayer(session: session)
                video.frame = view.layer.bounds
                view.layer.addSublayer(video)
                session.startRunning()
            } catch {
                print("Error")
            }
        }
    }


}

