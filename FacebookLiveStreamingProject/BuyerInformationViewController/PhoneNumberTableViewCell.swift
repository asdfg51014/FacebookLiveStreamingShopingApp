//
//  PhoneNumberTableViewCell.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
