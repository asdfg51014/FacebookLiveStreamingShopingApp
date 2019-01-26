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

struct ActivityView {
    
    let size = CGSize(width: 50, height: 50)
    
    let message = "Loading..."
    
    let font = UIFont(name: "HelveticaNeue", size: 15)
    
    let activityColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
    
    let padding: CGFloat = 50
    
    let backgroundColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 0.5)
    
    let textColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
    
}
