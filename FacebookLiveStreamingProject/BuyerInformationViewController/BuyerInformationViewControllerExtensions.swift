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
        case 3:
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
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            break
        }
        
        
        return userInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: nameReuseId, for: indexPath) as! NameTableViewCell
            cell.nameLabel.text = "Name"
            cell.userNameLabel.text = ""
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: emailReuseId, for: indexPath) as! EmailTableViewCell
            cell.emailLabel.text = "Email"
            cell.userEmailLabel.text = ""
            return cell
        case 2:
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
    
    func getUserInformation(){
        
        guard var userToken = userDefault.value(forKey: UserDefaultKeys.token.rawValue) as? String else {
            return
        }
        
        Requests.getRequset(api: CommonAPIs.getUserInformation, header: Header.init(token: userToken).header) { (data) in
            let json = try? JSON(data: data)
            
            if json!["result"].bool == true {
                let result = json!["response"].dictionary
                let url = URL(string: "\(json!["response"]["avatar"])")
                let imageData = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.userImageView.image = UIImage(data: imageData!)
                }
            }
            
        }
    }
    
    
}
