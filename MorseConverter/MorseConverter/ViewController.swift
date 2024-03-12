//
//  ViewController.swift
//  MorseConverter
//
//  Created by Aryan on 3/24/22.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    var record: AVAudioSession!
    var recorder: AVAudioRecorder!
    @IBOutlet weak var MicClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        record = AVAudioSession.sharedInstance()

        do {
            try record.setCategory(.playAndRecord, mode: .default)
            try record.setActive(true)
            record.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.OnTap()
                    } else {
                        print("Failed")
                    }
                }
            }
        } catch {
             print("failed")
        }
        

    }
//    func loadRecordingUI() {
//
//        recordButton.addTarget(self, action: #selector(recordTapped()), for: .touchUpInside)
//    }

    @IBAction func OnTap() {
        if recorder == nil {
            start()
        } else {
            finish(success: true)
            
        }
    }

    
    func finish(success: Bool) {
        recorder.stop()
        recorder = nil

    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func start() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            recorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            recorder.delegate = self
            recorder.record()

        } catch {
            finish(success: false)
        }
    }




}

