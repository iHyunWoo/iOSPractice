//
//  CalendarCollectionViewCell.swift
//  Calendar
//
//  Created by 정현우 on 2022/12/14.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
	
	static let identifier = "CalendarCollectionViewCell"
	
	@IBOutlet weak var dateLabel: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
