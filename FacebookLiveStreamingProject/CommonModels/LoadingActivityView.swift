//
//  LoadingActivityView.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/25.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class ActivityView: UIViewController, NVActivityIndicatorViewable {
    
    let size = CGSize(width: 50, height: 50)
    
    let message = "Loading..."
    
    let font = UIFont(name: "HelveticaNeue", size: 15)
    
    let activityColor = UIColor.white
    
    let padding: CGFloat = 50
    
    let backgroundColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 0.5)
    
    let textColor = UIColor.white
    
    let a = startAnimating(, message: <#T##String?#>, messageFont: <#T##UIFont?#>, type: <#T##NVActivityIndicatorType?#>, color: <#T##UIColor?#>, padding: <#T##CGFloat?#>, displayTimeThreshold: <#T##Int?#>, minimumDisplayTime: <#T##Int?#>, backgroundColor: <#T##UIColor?#>, textColor: <#T##UIColor?#>, fadeInAnimation: <#T##FadeInAnimation?##FadeInAnimation?##(UIView) -> Void#>)
        
}


