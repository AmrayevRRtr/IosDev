//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Ruslan Amrayev on 03.11.2025.
//

import UIKit
import AVFoundation

struct Track {
    let title: String
    let artist: String
    let coverName: String
    let audioName: String
}


class ViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var player: AVAudioPlayer?
    var currentTrackIndex = 0
    var isPlaying = false

    
    let tracks: [Track] = [
        Track(title: "Believer", artist: "Imagine Dragons", coverName: "Believer", audioName: "Imagine Dragons - Believer"),
        Track(title: "Counting Stars", artist: "One Republic", coverName: "Counting_Stars", audioName: "One Republic - Counting Stars"),
        Track(title: "In da club", artist: "50 Cent", coverName: "In_Da_Club", audioName: "50 Cent - In Da Club"),
        Track(title: "Stressed out", artist: "21 pilots", coverName: "Stressed_Out", audioName: "Twenty one pilots - Stressed out"),
        Track(title: "This love", artist: "Maroon 5", coverName: "This_Love", audioName: "Maroon 5 - This Love")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTrack(index: currentTrackIndex)
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        coverImageView.layer.cornerRadius = 12
        coverImageView.clipsToBounds = true
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    
    func loadTrack(index: Int) {
        let track = tracks[index]
        songLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverName)
        
        
        if let path = Bundle.main.path(forResource: track.audioName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.prepareToPlay()
            } catch {
                print("Could not load \(track.audioName)")
            }
        }
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
            guard let player = player else { return }

            if isPlaying {
                player.pause()
                playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            } else {
                player.play()
                playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            }
            isPlaying.toggle()
        }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex + 1) % tracks.count
        loadTrack(index: currentTrackIndex)
        if isPlaying { player?.play() }
    }
    
    @IBAction func previousTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
        loadTrack(index: currentTrackIndex)
        if isPlaying { player?.play() }
    }


}

