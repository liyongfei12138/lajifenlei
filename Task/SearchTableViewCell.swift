//
//  SearchTableViewCell.swift
//  CHGP
//
//  Created by LonelyTown on 2019/6/26.
//  Copyright © 2019 LonelyTown. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var futureNameLabel: UILabel!
    
    @IBOutlet weak var futureCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
