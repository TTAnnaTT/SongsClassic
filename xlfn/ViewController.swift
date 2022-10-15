//
//  ViewController.swift
//  xlfn


import UIKit
import AVFoundation

class ViewController: UIViewController {
    var skazka : String = ""
    @IBOutlet weak var teremok: UIButton!
    @IBOutlet weak var kolobok: UIButton!
    @IBOutlet weak var kurochka: UIButton!
    @IBOutlet weak var mashs: UIButton!
    
        
    @IBAction func button(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 1{
            skazka = "teremok"
            playSound()
        }
        if tag == 2{
            skazka = "kolobok"
            playSound()
        }
        if tag == 3{
            skazka = "kurochka"
            playSound()
        }
        if tag == 4{
            skazka = "mashenka"
            playSound()
        }
                
    }
    var player: AVAudioPlayer?
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: String(skazka) , withExtension: "mp3") else { return }

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
        let imageTeremok = UIImage(named: "teremok.png")
        teremok.setImage(imageTeremok?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        teremok.layer.cornerRadius = 10
        
        let imageKolobok = UIImage(named: "kolobok.png")
        kolobok.setImage(imageKolobok?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        kolobok.layer.cornerRadius = 10
        
        let imageKurochka = UIImage(named: "Ryaba.png")
        kurochka.setImage(imageKurochka?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        kurochka.layer.cornerRadius = 10
        
        let imageMasha = UIImage(named: "masha.png")
        mashs.setImage(imageMasha?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        mashs.layer.cornerRadius = 10
    }
   
    


}

