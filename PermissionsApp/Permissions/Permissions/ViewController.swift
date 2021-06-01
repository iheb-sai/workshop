//
//  ViewController.swift
//  Permissions
//
//  Created by Iheb Rahali on 01.06.21.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func camera(_ sender: Any) {
    }
    
    @IBAction func notifications(_ sender: Any) {
    }
    
}

