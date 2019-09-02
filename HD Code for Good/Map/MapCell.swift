//
//  MapCell.swift
//  HD Code for Good
//
//  Created by Brian Li on 8/29/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {


    @IBOutlet weak var eventLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
