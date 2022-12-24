//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by 정현우 on 2022/12/24.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
	
	static let identifier = "PlayerViewController"
	
	@IBOutlet weak var coverImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artistLabel: UILabel!
	@IBOutlet weak var progressView: UIProgressView!
	
	
	@IBOutlet weak var backButton: UIImageView!
	@IBOutlet weak var playPauseButton: UIImageView!
	@IBOutlet weak var nextButton: UIImageView!
	
	var position: Int = 0
	var musics: [MusicDataModel] = []
	
	var player: AVAudioPlayer?
	
	var timer: Timer?
	var time: Float = 0.0
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureViews()
		configurePlayer()
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		if let player = player {
			player.stop()
		}
	}
	
	func configureViews() {
		let music = musics[position]
		coverImageView.image = UIImage(named: music.coverImgName)
		titleLabel.text = music.name
		artistLabel.text = music.artistsName
		
		let playPauseButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPlayPauseButton))
		playPauseButton.addGestureRecognizer(playPauseButtonTapGesture)
		playPauseButton.isUserInteractionEnabled = true
		
		let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBackButton))
		backButton.addGestureRecognizer(backButtonTapGesture)
		backButton.isUserInteractionEnabled = true
		
		let nextButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapNextButton))
		nextButton.addGestureRecognizer(nextButtonTapGesture)
		nextButton.isUserInteractionEnabled = true
	}
	
	func configurePlayer() {
		let music = musics[position]
		guard let url = Bundle.main.url(forResource: music.fileName, withExtension: "mp3") else {return}
		do {
			try AVAudioSession.sharedInstance().setMode(.default)
			try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

			player = try AVAudioPlayer(contentsOf: url)
			guard let player = player else {return}
			player.volume = 0.5
			player.play()
			configureProgressView()
		} catch {
			print(error.localizedDescription)
		}
	}
	
	func configureProgressView() {
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configureProgress), userInfo: nil, repeats: true)
	}
	@objc func configureProgress() {
		let currentTime = Float(player?.currentTime ?? 0)
		progressView.setProgress(currentTime/60, animated: true)
	}
	
	
	@objc func didTapPlayPauseButton() {
		if player?.isPlaying == true {
			player?.pause()
			playPauseButton.image = UIImage(systemName: "play")
		} else {
			player?.play()
			playPauseButton.image = UIImage(systemName: "pause")
		}
	}
	
	@objc func didTapBackButton() {
		if position > 0 {
			position -= 1
			player?.stop()
			progressView.setProgress(0, animated: true)
			configureViews()
			configurePlayer()
		}
	}
	
	@objc func didTapNextButton() {
		if position < (musics.count - 1) {
			position += 1
			player?.stop()
			progressView.setProgress(0, animated: true)
			configureViews()
			configurePlayer()
		}
	}
	
	
    


}
