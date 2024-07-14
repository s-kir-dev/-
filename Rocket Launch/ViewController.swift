//
//  ViewController.swift
//  Rocket Launch
//
//  Created by Кирилл Сысоев on 13.04.24.
//

import UIKit
import AVFoundation //библиотека со звуком основная

class ViewController: UIViewController {
    @IBOutlet weak var rocketView: UIView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
    }


    @IBAction func powerButton(_ sender: Any) {
        rocketView.isHidden = false
        player.play()
        successLabel.isHidden = false
        let frame = rocketImage.frame
        rocketImage.frame.origin.y = 1000
        UIView.animate(withDuration: 3.5) { [self] in
            rocketImage.frame = frame
        } completion: { [self] (_) in
            successLabel.isHidden = false
        }


    }
}

