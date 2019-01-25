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
    
    var sendUserInformationDelegate: BuyerInformationDelegate?
    
    var userDefault = UserDefaults.standard
    
    let fullScreen = UIScreen.main.bounds
    
    let ivc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IVC")
    
    let nvaiView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3), type: NVActivityIndicatorType.ballClipRotate, color: UIColor.black, padding: 50)
    
    let underNvaiView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    let smallView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4))
    
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
                    let json = try? JSON(data: callResult)
                    if json!["result"].bool == true {
                        DispatchQueue.main.async {
                            self.judgmentUserDefaultToken(tokenKey: UserDefaultKeys.token.rawValue)
                        }
                    }
                })
            }
        }
    }
    
    func judgmentUserDefaultToken(tokenKey: String?){
        startAnimation()
        guard let usertoken = userDefault.value(forKey: tokenKey!) as? String else {
            stopAnimation()
//            showErrorAlert()
            return
        }
        Requests.getRequset(api: CommonAPIs.getUserInformation, header: Header.init(token: usertoken).header) { (callBack) in
            DispatchQueue.main.async {
                let json = try? JSON(data: callBack)
                if let jsonResult = json!["result"].bool {
                    if jsonResult == true {
                        self.navigationController?.pushViewController(self.ivc, animated: true)
                    }
                    self.stopAnimation()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        judgmentUserDefaultToken(tokenKey: UserDefaultKeys.token.rawValue)
    }
    
    override func viewWillLayoutSubviews() {
        setNVActivityIndicatorView()
    }
}


