//
//  MessageCell.swift
//  HD Code for Good
//
//  Created by Brian Li on 7/14/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var summarylabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    
    @IBOutlet weak var Locationlabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}