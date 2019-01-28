//
//  ContryCode.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/27.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation

class CountryCode {
    let phoneCode: [Int]
    let countryCode: [String]
    
    init(_ phoneCode: [Int], _ countryCode: [String]) {
        self.phoneCode = phoneCode
        self.countryCode = countryCode
    }
}
