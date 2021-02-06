//
//  ViewControllerTests.swift
//  FakeMusicPlayerTests
//
//  Created by Brian Keane on 2/5/21.
//

import XCTest
@testable import FakeMusicPlayer

class ViewControllerTests: XCTestCase {
  
  var vc: ViewController = ViewController()
  var mockAudioPlayer = MockAudioPlayer()
  
  override func setUpWithError() throws {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
    vc.loadView()
    
    vc.audioPlayer = MockAudioPlayer()
    mockAudioPlayer.delegate = vc
    
    let _ = vc.view
  }
  
  func testWhenInitialized_playButtonDisplaysPlay() throws {
    XCTAssertEqual(vc.playButton.titleLabel!.text, "Play")
  }
  
  func testWhenPlayerStartsPlaying_changesButtonTextToStop() throws {
    mockAudioPlayer.simulatePlay()
    RunLoop.current.run(until: Date())
    XCTAssertEqual(vc.playButton.titleLabel!.text!, "Stop")
  }
  
  func testWhenPlayerStopsPlaying_changesButtonTextToPlay() throws {
    mockAudioPlayer.simulatePlay()
    mockAudioPlayer.simulateStop()
    XCTAssertEqual(vc.playButton.titleLabel!.text!, "Play")
  }
  
  func testWhenVolumeChanges_VolumeLabelIsAppropriatelyUpdate() throws {
    mockAudioPlayer.simulateVolumeChanged(newVolume: 0.32)
    XCTAssertEqual(vc.volumeLabel!.text!, "32")
  }
  
}
