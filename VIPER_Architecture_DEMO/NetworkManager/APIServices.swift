//
//  APIServices.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import Foundation

typealias AnyDict = [String: Any]
typealias AnyDictString = [String: String]

let DEV_ROOT_POINT = "https://jarvis.mynationvoice.com/"
let PROD_ROOT_POINT = "https://jarvis.mynationvoice.com/"

let contentValue = "application/json"
let contentKey = "Content-Type"

enum NetworkEnvironment: String {
    case development
    case production
}

var networkEnvironment: NetworkEnvironment {
    return .development
}

var BaseURL: String {
    switch networkEnvironment {
    case .development :
        return DEV_ROOT_POINT
    case .production :
        return PROD_ROOT_POINT
    }
}


enum APIServices {
    case getNews(parameters: AnyDict)
}

extension APIServices {
    var Path: String {
        let apiDomain = "v2/"
        var servicePath: String = "sub-category/"
        switch self {
        case .getNews: servicePath = apiDomain + servicePath + "storylist"
        }
        
        return BaseURL + servicePath
    }
    
    
    var parameters: AnyDict? {
        switch self {
        case .getNews(let param) :
            return param
        default:
            return nil
        }
    }
    
    //headers code
    var header: AnyDictString {
        var headerDict = AnyDictString()
        headerDict[contentKey] = contentValue
        
        switch self {
//        case :
//            let currentAccessToken = "NO TOKEN"
//            headerDict = [contentKey: contentValue,
//                          "access_token": currentAccessToken]
        default:
            break
        }
        return headerDict
    }
    
    var httpMethod: String {
        switch self {
        case .getNews :
            return "GET"
        default:
            return "POST"
        }
    }
}
