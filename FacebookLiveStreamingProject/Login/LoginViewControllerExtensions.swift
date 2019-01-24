//
//  LoginViewControllerExtensions.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/24.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    var boolValue: Bool {return self != 0}
}

extension LoginViewController {
    
    func showErrorAlert(){
        let alertController = UIAlertController(title: "Error", message: "Check your Facebook account", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showSuccessAlert(){
        let alertController = UIAlertController(title: "Login Success", message: "Click Ok to choose your identity.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (myAlert) in
            self.navigationController?.pushViewController(self.ivc, animated: true)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func setNVActivityIndicatorView(){
        
        underNvaiView.backgroundColor = UIColor.black
        underNvaiView.alpha = 0.5
        underNvaiView.center = view.center
        view.addSubview(underNvaiView)
        //        underNvaiView.isHidden = true
        
        smallView.backgroundColor = UIColor.white
        smallView.layer.cornerRadius = UIScreen.main.bounds.width / 20
        smallView.clipsToBounds = true
        smallView.center = underNvaiView.center
        view.addSubview(smallView)
        //        smallView.isHidden = true
        
        nvaiView.center = underNvaiView.center
        view.addSubview(nvaiView)
        //        nvaiView.isHidden = true
    }
    
    func startAnimation(){
        underNvaiView.isHidden = false
        smallView.isHidden = false
        nvaiView.isHidden = false
        nvaiView.startAnimating()
    }
    
    func stopAnimation(){
        underNvaiView.isHidden = true
        smallView.isHidden = true
        nvaiView.isHidden = true
        nvaiView.stopAnimating()
    }
}

