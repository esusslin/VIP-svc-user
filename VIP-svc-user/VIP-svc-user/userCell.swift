//
//  userCell.swift
//  VIP-svc-user
//
//  Created by Emmet Susslin on 7/11/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {
    
    
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var lastLbl: UILabel!
    @IBOutlet weak var email: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
