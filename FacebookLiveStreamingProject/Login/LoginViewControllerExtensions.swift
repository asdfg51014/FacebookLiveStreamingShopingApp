//
//  LoginViewControllerExtensions.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension LoginViewController: NVActivityIndicatorViewable {
    
    func showErrorAlert(){
        let alertController = UIAlertController(title: "Error", message: "Check your Facebook account", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func startActivityAnmation(){
        startAnimating(activityProperty.size, message: activityProperty.message, messageFont: activityProperty.font, type: NVActivityIndicatorType.ballClipRotate, color: activityProperty.activityColor, padding: activityProperty.padding, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: activityProperty.backgroundColor, textColor: activityProperty.textColor, fadeInAnimation: nil)
    }
}

