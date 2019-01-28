//
//  LoginViewController.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/21.
//  Copyright © 2019 Albert.C. All rights reserved.
//
import UIKit
import FacebookLogin
import FacebookCore
import NVActivityIndicatorView
import SwiftyJSON

class LoginViewController: UIViewController {
    
    let activityProperty = ActivityView()
    
    var userDefault = UserDefaults.standard
    
    let url = Url.url
    
    lazy var header: [String: String] = [:]
    
    @IBAction func loginButton(_ sender: UIButton){
        
        FacebookLogin.login(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        IsTokenCreate.istokenCreate(self)
    }
    
}


