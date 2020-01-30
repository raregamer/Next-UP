//
//  GameDetailsTableViewCell.swift
//  Next UP
//
//  Created by Samuel Elbaz on 1/29/20.
//  Copyright © 2020 Samuel Elbaz. All rights reserved.
//

import UIKit

class GameDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCoverView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
