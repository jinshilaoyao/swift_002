//
//  NetWorkManager.swift
//  laolin
//
//  Created by yesway on 16/7/1.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit
import Alamofire


public enum HTTPRequestType {
    case GET, HEAD, PUT, POST, DELETE
    
    var name: String {
        switch self {
        case .GET:
            return "GET"
        case .HEAD : return "HEAD"
        case .PUT: return "PUT"
        case .POST : return "POST"
        case .DELETE : return "DELETE"
        }
    }
}

public enum RequestType {
    case String, JSON, RawData
}

public class NetWorkManager: Manager {
    
    public var baseURL: String?
    
    func getDataFromEndPoint(endPoint: String?, requestType: RequestType, resultData:(Result<AnyObject, NetWorkingError>) -> ()) {
        
        guard let setURL = self.baseURL else {
            print("Error in baseURL")
            return
        }
        
        let requestURL = (endPoint != nil) ? "\(setURL)\(endPoint)" : setURL
        
        switch requestType {
        case .String:
            Alamofire.request(.GET, requestURL).responseString(completionHandler: { (StringResponse) in
                
            })
        case .JSON:
            Alamofire.request(.GET, requestURL).responseJSON(completionHandler: { (JSONResponse) in
                
            })
        case .RawData:
            Alamofire.request(.GET, requestURL).responseData(completionHandler: { (DataResponse) in
                
            })
        }
        
        
    }
    
}
