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
    
    let ivc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IVC")
    
    @IBAction func loginButton(_ sender: UIButton){
        let manager = LoginManager()
        manager.logIn(readPermissions: [.publicProfile], viewController: self) { (result) in
            switch result {
            case .cancelled:
                print("Login cancelled")
            case .failed(let error):
                print(error.localizedDescription)
            case .success(let grantedPermissions, let declinedPermissions, let token):
                
                self.userDefault.setValue(token.authenticationToken, forKey: UserDefaultKeys.token.rawValue)
                Requests.post(api: "token", token: token.authenticationToken, expirationDate: token.expirationDate, callBack: { (callResult) in
                    do {
                        let json = try? JSON(data: callResult)
                        guard json!["result"].bool! else {
                            return
                        }
                        self.judgmentUserDefaultToken(tokenKey: UserDefaultKeys.token.rawValue)
                    } catch {
                        print(error.localizedDescription)
                    }
                })
            }
        }
    }
    
    func judgmentUserDefaultToken(tokenKey: String?){
        startActivityAnmation()
        guard let usertoken = userDefault.value(forKey: tokenKey!) as? String else {
            stopAnimating()
            return
        }
        Requests.getRequset(api: CommonAPIs.getUserInformation, header: Header.init(token: usertoken).header) { (callBack) in
            DispatchQueue.main.async {
                do {
                    let json = try JSON(data: callBack)
                    if let jsonResult = json["result"].bool {
                        if jsonResult == true {
                            self.navigationController?.pushViewController(self.ivc, animated: true)
                        }
                        self.stopAnimating()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        judgmentUserDefaultToken(tokenKey: UserDefaultKeys.token.rawValue)
    }
}


