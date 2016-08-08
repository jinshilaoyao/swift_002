//
//  BaseBusiness.swift
//  laolin
//
//  Created by yesway on 16/6/30.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit
import Alamofire

enum businessType {
    case businessType_get, businessType_delete, businessType_add,businessType_download,businessType_none
}

class BaseBusiness: NSObject {
    
    var currentIP: String = ""
    
    var type: businessType = .businessType_none
    
    let manager = Alamofire.Manager.sharedInstance
    
    let netWorkingManager = NetWorkManager()
    
    func execute(param param: [String : AnyObject] ,WithHeader header: [String: AnyObject]?,completionHandler:(NSData?) -> Void,failure:(NSError?) -> Void){
        
        Alamofire.request(.GET, currentIP).response { (request, response, data, error) in
            
            if error?.code == nil {
                completionHandler(data)
            } else {
                failure(error)
            }
            
        }
        
        
        
        
    }
    
    func executeDownload(param param: [String : AnyObject],WithHeader header: [String : AnyObject]?,failure:(NSError?) -> Void,completionHandler:(NSData?) -> Void,progress:(Int64, Int64, Int64)->Void) {
        
        Alamofire.download(.GET, currentIP) { (url, response) -> NSURL in
            
            if ( response.statusCode == 404) {
                failure(nil)
            }
            
            let fileManager = NSFileManager.defaultManager()
            let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
            let pathComponent = response.suggestedFilename
            
            return directoryURL.URLByAppendingPathComponent(pathComponent!)
            
        }.progress { (byresRead, totalBytesRead, totalBytesExpectedToRead) in
            
            dispatch_async(dispatch_get_main_queue()) {
                progress(byresRead, totalBytesRead, totalBytesExpectedToRead)
            }
            
        }
        
//        Alamofire.download(.GET, currentIP, destination: nil)
//            .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
//            print(totalBytesRead)
//            
//            // This closure is NOT called on the main queue for performance
//            // reasons. To update your ui, dispatch to the main queue.
//            dispatch_async(dispatch_get_main_queue()) {
//                print("Total bytes read on main queue: \(totalBytesRead)")
//            }
//        }
        
    }
    
    
    func creatBusiness(type: businessType) -> BaseBusiness?{
        
        switch type {
        case .businessType_get:
            return getBaseBusiness()
        case .businessType_delete:
            return deleteBaseBusiness()
        case .businessType_add:
            return addBusiness()
        case .businessType_download :
            return downloadBusiness()
        case .businessType_none:
            break
        }
        return nil
    }
}
