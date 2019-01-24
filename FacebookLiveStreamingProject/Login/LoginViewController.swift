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
                    if ((callResult["result"] as? Int)?.boolValue)! {
                        DispatchQueue.main.async {
                            self.judgmentUserDefaultToken(tokenKey: UserDefaultKeys.token.rawValue)
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
        startAnimation()
        print("judgggg")
        guard let usertoken = userDefault.value(forKey: tokenKey!) as? String else {
            stopAnimation()
            showErrorAlert()
            return
        }

        Requests.getRequset(api: CommonAPIs.getUserInformation, header: Header.init(token: usertoken).header) { (callBack) in
            DispatchQueue.main.async {
                if (callBack["result"] as! Int).boolValue {
                    
                    self.stopAnimation()
                    self.navigationController?.pushViewController(self.ivc, animated: true)
                    print("call back response: \(callBack["response"]!)")
//                    sendUserInformationDelegate?.sendBuyerInformation(name: callBack["response"]!["name"] as! String, email: callBack["response"]!["email"] as! String, imageURL: callBack["response"]!["avatar"] as! String)
                } else {
                    self.stopAnimation()
//                    self.showErrorAlert()
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
