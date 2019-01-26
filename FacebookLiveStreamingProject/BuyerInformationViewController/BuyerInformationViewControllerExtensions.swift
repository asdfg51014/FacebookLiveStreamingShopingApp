//
//  BuyerInformationViewControllerExtensions.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

extension BuyerInformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 100
        default:
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        default:
            break
        }
        
        
        return userInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: phoneNumberReuserId, for: indexPath) as! PhoneNumberTableViewCell
            cell.phoneNumberLabel.text = "Phone Number"
            cell.userPhoneNumberTextField.text = ""
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: addressReuseId, for: indexPath) as! AddressTableViewCell
            return cell
        }
    }
}

extension BuyerInformationViewController {
    
    func setUserImageView(){
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
        userImageView.layer.borderWidth = 3
    }
    
    func getUserInformation(){
        
        guard var userToken = userDefault.value(forKey: UserDefaultKeys.token.rawValue) as? String else {
            return
        }
        Requests.getRequset(api: CommonAPIs.getUserInformation, header: Header.init(token: userToken).header) { (data) in
            let json = try? JSON(data: data)
            
            guard json!["result"].bool == true else {
                return
            }
            let url = URL(string: "\(json!["response"]["avatar"])")
            let imageData = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.userImageView.image = UIImage(data: imageData!)
                self.nameLabel.text = "name" + "\n\(json!["response"]["name"].string!)"
                self.emailLabel.text = "email" + "\n\(json!["response"]["email"].string!)"
            }
        }
    }
}
