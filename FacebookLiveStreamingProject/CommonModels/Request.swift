//
//  Request.swift
//  FacebookLiveStreamingProject
//
//  Created by Albert on 2019/1/21.
//  Copyright © 2019 Albert.C. All rights reserved.
//

import Foundation
import SwiftyJSON



struct Url {
    static let url = "https://facebookoptimizedlivestreamsellingsystem.rayawesomespace.space/api"
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

struct GetApis {
    static let getRecipientsInformationUnderAUser = "/api/recipients"
    
    static let getCountryCodeAndPhoneCode = "/api/country-code"
    
//    let getAllPlacedOrdersList: String
    
    static let getLastestOrdersList = "/api/lastest-channel-orders"
    
    static let getUploadedItemsInformation = "/api/items"
    
    static let getLiveStreamHistory = "/api/channels"
    
    static let getPlaedOrdersInDetail = "/api/sekker-orders"
    
//    let getDesignatedOrderInDetail: String
    
    let getAllSoldItemsInDetail = "/api/sold-items"
    
//    let getItemsSoldOnTheDesignatedLiveStreamingInDetail: String
    
    
//    init(userID: Int) {
//        getAllPlacedOrdersList = "/api/orders/\(userID)"
//    }
    
//    init(getDesignatedOrderInDetailChannelId: Int) {
//        getDesignatedOrderInDetail = "/api/seller-order/\(channelId)"
//    }
    
//    init(getItemsSoldOnTheDesignatedLiveStreamingInDetailChannelId: String) {
//        getItemsSoldOnTheDesignatedLiveStreamingInDetail = ""
//    }
    
    
}

struct CommonAPIs {
    static let updateOrInsertNewToken = "/token"
    static let getUserInformation = "/users"
    let getStreamingItemInformation: String
    
    init(channelId: String) {
        getStreamingItemInformation = "/streaming-item/\(channelId)"
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
    let serminateLiveVideoSteaming = "/user-channel-id"
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

struct Body {
    
    let body: [String: String]
    
    init(expirationDate: Date) {
        body = [
            "expirationDate": "\(expirationDate)"
        ]
    }
    
}


struct Requests {
    
    static func post(_ url: String, _ api: String, _ header: [String: String], _ body: [String: String], _ callBack: @escaping (Data) -> Void) {
        
        let jsonData = try? JSONEncoder().encode(body)
        
        let urlApi = URL(string: url + api)!
        var urlRequest = URLRequest(url: urlApi)
        urlRequest.httpMethod = "POST"
        for headers in header {
            urlRequest.addValue(headers.value, forHTTPHeaderField: headers.key)
        }
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            guard error == nil else {
                callBack(data)
                print(error?.localizedDescription ?? "No Data")
                return
            }
            callBack(data)
        }
        task.resume()
    }
    
    
    static func getRequset(_ url: String, _ api: String, _ header: [String: String], _ callBack: @escaping (Data) -> Void){
        
        let urlApi = URL(string: url + api)!
        var urlRequset = URLRequest(url: urlApi)
        
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
            callBack(data)
        }
        task.resume()
    }
}
