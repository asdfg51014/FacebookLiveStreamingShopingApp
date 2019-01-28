//
//  IsTokenCreated.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/28.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import UIKit
import SwiftyJSON


class IsTokenCreate: UIViewController {
    static func istokenCreate(_ viewController: UIViewController){
        NVActivityAnimationModel.startNVActivityAnimation()
        
        NVActivityAnimationModel.startNVActivityAnimation()
        guard let userToken = UserDefaultFile.userDefault.value(forKey: UserDefaultKeys.token.rawValue) as? String else {
            NVActivityAnimationModel.stopNVActivityAnimation()
            return
        }
        
        Requests.getRequset(Url.url, CommonAPIs.getUserInformation, Header.init(token: userToken).header){(callBack) in
            DispatchQueue.main.async {
                do {
                    let json = try JSON(data: callBack)
                    print("json: \(json)")
                    if let jsonResult = json["result"].bool {
                        print("jsonr: \(jsonResult)")
                        if jsonResult == true {
                            NVActivityAnimationModel.stopNVActivityAnimation()
                            viewController.navigationController?.pushViewController(ivc, animated: true)
                        }
                        NVActivityAnimationModel.stopNVActivityAnimation()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
