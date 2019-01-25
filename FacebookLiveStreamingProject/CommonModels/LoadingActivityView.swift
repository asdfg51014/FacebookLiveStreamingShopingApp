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
    
    let fullSCreen = UIScreen.main.bounds
    let nvavFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
    let baseView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    let mediumView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4))
//    let nvActivityView = NVActivityIndicatorView(frame: nvavFrame, type: type, color: color, padding: padding)
    let nvActivityView: UIView
    
//    init (fullScreen: CGFloat, type: NVActivityIndicatorType, color: UIColor, padding: CGFloat){
//        nvActivityView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: , height: <#T##CGFloat#>), type: type, color: color, padding: padding)
//        
//    }
    
    
    func createActivityView(inputView: UIView, type: NVActivityIndicatorType, color: UIColor, padding: CGFloat, inputTitle: String){
        
        
        baseView.backgroundColor = UIColor.black
        baseView.alpha = 0.5
        baseView.center = inputView.center
        inputView.addSubview(baseView)
        
        mediumView.backgroundColor = UIColor.white
        baseView.alpha = 0.5
        mediumView.layer.cornerRadius = mediumView.frame.width / 5
        mediumView.center = baseView.center
        inputView.addSubview(mediumView)
        
        nvActivityView.center = inputView.center
        inputView.addSubview(nvActivityView)
    }
    
    static func startLoading(){
        
    }
    
}
