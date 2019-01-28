//
//  UserDefaultFile.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/28.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation

enum UserDefaultKeys: String {
    case token = "UserToken"
}

struct UserDefaultFile {
    static let userDefault = UserDefaults.standard
}
