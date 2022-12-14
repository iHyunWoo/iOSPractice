//
//  LocalKeywordSearchTableViewCell.swift
//  KakaoLocalKeywordSearchPractice
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class LocalKeywordSearchTableViewCell: UITableViewCell {
	
	@IBOutlet weak var placeNameLabel: UILabel!
	@IBOutlet weak var roadAddressName: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
