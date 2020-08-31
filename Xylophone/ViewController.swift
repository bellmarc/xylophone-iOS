//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Edited by Marc
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //added for wav


class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//Pre-built Apple APIs manual
    @IBAction func keyPressed(_ sender: UIButton) {
//        print("Red got pressed")
        playSound()
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else {return}
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            player.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
//    @IBAction func keyPressedOrange(_ sender: UIButton) {
//        print("Orange pressed")
//    }
    
}

