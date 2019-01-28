//
//  LoginModel.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/28.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit
import FacebookLogin
import FacebookCore
import SwiftyJSON

struct FacebookLogin {
    
    static let userDefault = UserDefaults.standard
    
    static func login(_ viewController: UIViewController){
        let manager = LoginManager()
        manager.logIn(readPermissions: [.publicProfile], viewController: viewController) { (loginResult) in
            switch loginResult {
            case .cancelled:
                print("Login cancelled")
            case .failed(let error):
                print(error.localizedDescription)
            case .success( _,  _, let token):
                
                self.userDefault.setValue(token.authenticationToken, forKey: UserDefaultKeys.token.rawValue)
                
                Requests.post(Url.url, "/token", Header.init(token: token.authenticationToken).header, Body.init(expirationDate: token.expirationDate).body){
                    (callBack) in
                    do {
                        let json = try JSON(data: callBack)
                        guard json["result"].bool! else {
                            return
                        }
                        //
                        
                        IsTokenCreate.istokenCreate(viewController)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
