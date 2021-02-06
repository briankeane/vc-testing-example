//
//  AudioPlayerProtocol.swift
//  FakeMusicPlayer
//
//  Created by Brian Keane on 2/5/21.
//

import Foundation

enum AudioPlayerStatus {
  case playing
  case stopped
}

protocol AudioPlayer {
  var volume:Double { get set }
  var delegate:AudioPlayerDelegate? { get set }
  var status: AudioPlayerStatus { get set }
  
  func play()
  func stop()
  func setVolume(newVolume: Double)
}
