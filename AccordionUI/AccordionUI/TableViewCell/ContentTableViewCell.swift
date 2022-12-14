//
//  ContentTableViewCell.swift
//  AccordionUI
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
	
	static let identifier = "ContentTableViewCell"

	@IBOutlet weak var contentLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
