//
//  Analyzes.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/26.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Analyzes {
    static func createToken(_ token: String, _ expirationDate: Date, _ viewController: UIViewController){
        Requests.post(Url.url, "/token", Header.init(token: token).header, Body.init(expirationDate: expirationDate).body){
            (callBack) in
            do {
                let json = try? JSON(data: callBack)
                guard json!["result"].bool! else {
                    return
                }
                //
                IsTokenCreate.istokenCreate(viewController)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserInformation(){
        
    }
    
    
    static func abc(data: Data){
        
    }
    
}
