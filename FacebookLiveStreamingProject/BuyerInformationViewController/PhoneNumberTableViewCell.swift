//
//  PhoneNumberTableViewCell.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var phoneCode: [Int] = []

    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    
    @IBOutlet weak var userPhoneCodeTextField: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneCode.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(phoneCode[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userPhoneCodeTextField.text = "\(phoneCode[row])"
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
