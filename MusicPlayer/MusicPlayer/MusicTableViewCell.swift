//
//  MusicTableViewCell.swift
//  MusicPlayer
//
//  Created by 정현우 on 2022/12/24.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
	
	static let identifier = "MusicTableViewCell"
	
	@IBOutlet weak var coverImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
