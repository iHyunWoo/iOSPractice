//
//  TitleTableViewCell.swift
//  AccordionUI
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
	
	static let identifier = "TitleTableViewCell"

	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var openButton: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	
	
}
