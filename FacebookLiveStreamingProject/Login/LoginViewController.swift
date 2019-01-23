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

class LoginViewController: UIViewController {
    
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
                    if ((callResult["result"] as? Int)?.boolValue)! {
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(self.ivc, animated: true)
                        }
                    } else {
                        self.showErrorAlert()
                    }
                })
                let connection = GraphRequestConnection()
                connection.add(GraphRequest(graphPath: "/me")){httpResponse, result in
                    switch result {
                    case .success(let response):
                        print("id: \(response.dictionaryValue!["id"]!)")
                        print("name: \(response.dictionaryValue!["name"]!)")
                    case .failed(let error):
                        print(error.localizedDescription)
                    }
                }
                connection.start()
            }
        }
    }
    
    func judgmentUserDefaultToken(tokenKey: String?){
        
        guard var usertoken = userDefault.value(forKey: tokenKey!) as? String else {
            showErrorAlert()
            return
        }

        Requests.getRequset(api: "users", header: Header.init(token: usertoken).header) { (callBack) in
            DispatchQueue.main.async {
                if (callBack["result"] as! Int).boolValue {
                    self.navigationController?.pushViewController(self.ivc, animated: true)
                } else {
                    self.showErrorAlert()
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
    
}
