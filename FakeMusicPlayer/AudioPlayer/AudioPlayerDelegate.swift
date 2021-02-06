//
//  AudioPlayerDelegate.swift
//  FakeMusicPlayer
//
//  Created by Brian Keane on 2/5/21.
//

import Foundation

protocol AudioPlayerDelegate {
  func playerStateDidChange(newStatus: AudioPlayerStatus)
  func audioVolumeDidChange(newVolume: Double)
}
