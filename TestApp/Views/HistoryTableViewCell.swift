//
//  HistoryTableViewCell.swift
//  TestApp
//
//  Created by Akhila Haridas on 03/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var cellImageView: UIImageView?
    
    var userObj: User? {
        didSet {
            lblName?.text = userObj?.fullName
            cellImageView?.sd_setImage(with: URL(string: (userObj?.thumbImage)!), placeholderImage: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Utils.setViewCornerRadius(view: cellImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
