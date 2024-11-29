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
        
        configureAudioSession()
        
        guard let soundURL = URL(string: soundResource) else {
            print("Sound not found")
            return
        }
        let playerItem = AVPlayerItem(url: soundURL)
        
        player = AVPlayer(playerItem: playerItem)
        player?.volume = 0.1
        player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        
    }
    
    private func configureAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowBluetooth])
            try audioSession.setActive(true)
        } catch {
            print("Erro ao configurar a sessão de áudio: \(error.localizedDescription)")
        }
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
