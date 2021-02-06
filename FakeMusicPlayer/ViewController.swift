//
//  ViewController.swift
//  FakeMusicPlayer
//
//  Created by Brian Keane on 2/5/21.
//

import UIKit

class ViewController: UIViewController {
  var audioPlayer:AudioPlayer = MyAudioPlayer()
  
  @IBOutlet weak var volumeLabel: UILabel!
  
  @IBOutlet weak var playButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    audioPlayer.delegate = self
  }
  
  @IBAction func playButtonTapped(_ sender: Any) {
    if self.audioPlayer.status == .playing {
      self.audioPlayer.play()
    } else {
      self.audioPlayer.stop()
    }
  }
}

extension ViewController: AudioPlayerDelegate {
  func playerStateDidChange(newStatus: AudioPlayerStatus) {
    let newText = newStatus == .playing ? "Stop" : "Play"
    ensureMainQueue {
      self.playButton.setTitle(newText, for: .normal)
    }
  }
  
  func audioVolumeDidChange(newVolume: Double) {
    ensureMainQueue {
      self.volumeLabel.text = String(Int(newVolume*100))
    }
  }
}
