//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 정현우 on 2022/12/23.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var musics: [MusicDataModel] = [
		MusicDataModel(name: "Shiver", albumName: "NCS", artistsName: "Sharks", coverImgName: "ShiverCoverImage", fileName: "Sharks - Shiver [NCS Release]"),
		MusicDataModel(name: "Alone", albumName: "NCS", artistsName: "BEAUZ, Heleen", coverImgName: "AloneCoverImage", fileName: "BEAUZ & Heleen - Alone [NCS Release]")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: MusicTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MusicTableViewCell.identifier)
		
		navigationItem.title = "Music"
		navigationController?.navigationBar.prefersLargeTitles = true
	}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return musics.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier) as? MusicTableViewCell else {return UITableViewCell()}
		let data = musics[indexPath.row]
		cell.coverImageView.image = UIImage(named: data.coverImgName)
		cell.titleLabel.text = data.name
		cell.artistNameLabel.text = data.artistsName
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let vc = storyboard?.instantiateViewController(withIdentifier: PlayerViewController.identifier) as? PlayerViewController else {return}
		vc.musics = self.musics
		vc.position = indexPath.row
//		vc.configure()
		
		present(vc, animated: true)
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
}
