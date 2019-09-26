//
//  ViewController.swift
//  Xylophone
//
//  Created by Marcin Tomczuk on 10/09/2019.
//  Copyright © 2019 Marcin Tomczuk. All rights reserved.
//

import UIKit
import AVFoundation





class ViewController: UIViewController{
    
    var player: AVAudioPlayer?
    let array = ["note1","note2","note3","note4","note5","note6","note7"]
    
    var selectedSoundFileName: String = ""
    func playSound() {
        guard let url = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton){
        
        selectedSoundFileName = array[sender.tag - 1]
        
        playSound()
        
    }
    
  

}

