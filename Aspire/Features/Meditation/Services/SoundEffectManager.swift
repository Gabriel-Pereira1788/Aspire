//
//  AudioManager.swift
//  Aspire
//
//  Created by Gabriel Pereira on 28/11/24.
//
import AVFoundation

class SoundEffectManager {
    private var player:AVPlayer?
    
    func play(resource soundResource:String) {
        
        
        guard let soundURL = Bundle.main.url(forResource:soundResource, withExtension: "mp3") else {
            print("Resource not found.")
            return
        }
        let playerItem = AVPlayerItem(url: soundURL)
        
        player = AVPlayer(playerItem: playerItem)
        player?.play()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        
    }
    
    @objc private func playerItemDidReachEnd(notification: Notification) {
        player?.seek(to: .zero)
        player?.play()
    }
    
    func stop() {
        player?.pause()
        NotificationCenter.default.removeObserver(self)
        player = nil
        
    }
}
