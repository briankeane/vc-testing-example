//
//  MyAudioPlayer.swift
//  FakeMusicPlayer
//
//  Created by Brian Keane on 2/5/21.
//

import Foundation

class MyAudioPlayer: AudioPlayer {
  var status: AudioPlayerStatus = .stopped
  
  var volume: Double = 1.0
  
  var delegate: AudioPlayerDelegate?
  
  init() {
    // Set up your AVAudioPlayer here
    
  }
  
  func play() {
    // code to play
    
  }
  
  func stop() {
    // code to stop
  }
  
  func setVolume(newVolume: Double) {
    self.volume = newVolume
    delegate?.audioVolumeDidChange(newVolume: newVolume)
  }
}
