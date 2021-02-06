//
//  MockAudioPlayer.swift
//  FakeMusicPlayerTests
//
//  Created by Brian Keane on 2/5/21.
//

import Foundation
@testable import FakeMusicPlayer

class MockAudioPlayer: AudioPlayer {
  var status: AudioPlayerStatus = .stopped
  
  var volume: Double = 1.0
  var delegate: AudioPlayerDelegate?
  
  var playFunctionCalled: Bool = false
  var stopFunctionCalled: Bool = false
  var setVolumeCalled: Bool = false
  
  func simulatePlay() {
    self.delegate?.playerStateDidChange(newStatus: .playing)
  }
  
  func simulateStop() {
    self.delegate?.playerStateDidChange(newStatus: .stopped)
  }
  
  func play() {
    self.playFunctionCalled = true
  }
  
  func stop() {
    self.stopFunctionCalled = true
  }
  
  func setVolume(newVolume: Double) {
    self.setVolumeCalled = true
    self.volume = newVolume
  }
  
  func simulateVolumeChanged(newVolume: Double) {
    self.volume = newVolume
    self.delegate?.audioVolumeDidChange(newVolume: newVolume)
  }
}
