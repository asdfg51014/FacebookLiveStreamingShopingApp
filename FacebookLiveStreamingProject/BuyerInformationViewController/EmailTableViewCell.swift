//
//  EmailTableViewCell.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
