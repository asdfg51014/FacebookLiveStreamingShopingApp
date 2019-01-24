//
//  Request.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/21.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import SwiftyJSON

enum UserDefaultKeys: String {
    case token = "UserToken"
}

//struct UsersUserDefault {
//    static let userDefault = UserDefaults.standard
//    func comformToken(key: String){
//
//    }
//}

//struct PostAPI {
//    var token = "/token"
//    var recipients: String
//    var orders: String
//
//    init(token: String, userID: String) {
//        self.token = token
//        self.recipients = "/recipients/\(userID)"
//
//    }
//}

struct CommonAPIs {
    static let updateOrInsertNewToken = "token"
    static let getUserInformation = "users"
    let getStreamingItemInformation: String
    
    init(channelId: String) {
        getStreamingItemInformation = "streaming-item/\(channelId)"
    }
}

struct ProductInformation {
    let getUploadedItemItemsInformation = "/items"
    let addNewItems = "/item"
//    let 修改商品
}

struct StartALiveStreaming {
    let startALiveStreaming = "/channel"
//    let 推播商品
//    let 取得上架資訊
    let serminateLiveVideoSteaming = "user-channel-id"
    let getLiveStreamHistory = "/channels"
    
}

struct OrderManagement {
//    let 推播商品
    let getPlacedOrdersInDetail = "/seller-orders"
    let getDesignatedOrderInDetail: String
    let getAllSoldItemsInDetail = "/sold-items"
    let getItemsSoldOnTheDesignatedLiveStreamingInDetail: String
    
    init(channelId: String) {
        getDesignatedOrderInDetail = "/seller-order/" + channelId
        getItemsSoldOnTheDesignatedLiveStreamingInDetail = "/sold-items/" + channelId
    }
}

//struct WatchLiveStreaming {
//    static let joinALiveStream = "/user-channel-id"
//    let getStreamingItemInformation: String?
//    let placeAnOrder: String
//    
//    init(channelId: String) {
//        getStreamingItemInformation = "/streaming-item/" + channelId
//    }
//    init(itemId: String) {
//        placeAnOrder = "/order/" + itemId
//    }
//}


struct Header {
    
    var header: [String: String]
    
    init(token: String) {
        header = [
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
            "Authorization": "Bearer \(token)"
            ]
    }
}

//struct Body {
//    <#fields#>
//}

struct Requests {
    static func post(api: String, token: String, expirationDate: Date, callBack: @escaping ([String: Any]) -> Void) {
        
        let json: [String: String] = ["expirationDate": "\(expirationDate)"]
        
        let jsonData = try? JSONEncoder().encode(json)
        
        let url = URL(string: "https://facebookoptimizedlivestreamsellingsystem.rayawesomespace.space/api/" + api)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        let header = Header.init(token: token).header
        for headers in header {
            urlRequest.addValue(headers.value, forHTTPHeaderField: headers.key)
        }
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            let json = try? JSON(data: data)
            print("json: \(json)")
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any]{
                callBack(responseJSON)
            }
        }
        task.resume()
    }
    
    
    static func getRequset(api: String, header: [String: String], callBack: @escaping ([String: Any]) -> Void){
        
        let url = URL(string: "https://facebookoptimizedlivestreamsellingsystem.rayawesomespace.space/api/" + api)
        var urlRequset = URLRequest(url: url!)
        
        for headers in header {
            urlRequset.addValue(headers.value, forHTTPHeaderField: headers.key)
        }
        urlRequset.httpMethod = "GET"
        print("ready to request")
        let task = URLSession.shared.dataTask(with: urlRequset) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error: \(error?.localizedDescription)")
                return
            }
            
            let json = try? JSON(data: data)
            if let jsonresult = json!["result"].bool {
                print("jsonresult: \(jsonresult)")
            }
            if let jsonResult = json?.dictionaryObject {
                print("test json: \(jsonResult)")
            }
//            if let jsonResult2 = jsonResult!["result"] {
//
//            }
            do {
                print("real json")
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    callBack(responseJSON)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
