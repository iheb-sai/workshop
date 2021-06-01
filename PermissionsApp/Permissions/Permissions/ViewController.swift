//
//  ViewController.swift
//  Permissions
//
//  Created by Iheb Rahali on 01.06.21.
//

import UIKit
import AVFAudio
import Photos

import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    
    @IBAction func microphone(_ sender: Any) {
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSession.RecordPermission.granted:
            print("Permission granted")
        case AVAudioSession.RecordPermission.denied:
            print("Pemission denied")
        case AVAudioSession.RecordPermission.undetermined:
            print("Request permission here")
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                // Handle granted
            })
        @unknown default:
            print("Unknown error")
        }
    }
    
    @IBAction func location(_ sender: Any) {

        locationManager?.requestAlwaysAuthorization()
    }
    
    @IBAction func camera(_ sender: Any) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: break // The user has previously granted access to the camera.
            //
            
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    //
                }
            }
            
        case .denied: // The user has previously denied access.
            return
            
        case .restricted: // The user can't grant access due to restrictions.
            return
        }
    }
    
}

