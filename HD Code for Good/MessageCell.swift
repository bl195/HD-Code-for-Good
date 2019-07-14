//
//  MessageCell.swift
//  HD Code for Good
//
//  Created by Brian Li on 7/14/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    let summary: String
    let location: String
    let time: String
    
    init(for loc: String, _ summ: String){
        self.summary = summ
        self.location = loc
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
