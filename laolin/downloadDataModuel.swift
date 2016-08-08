//
//  downloadDataModuel.swift
//  laolin
//
//  Created by yesway on 16/6/30.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class downloadDataModuel: BaseDataModuel {
    
    
    func download(progress:(Double)->Void) {
        baseBusiness = creatBusinessWithType(.businessType_download)
        
        let dict = ["user":"jinshilaoyao"]
        
        baseBusiness.execute(param: dict, WithHeader: nil, completionHandler: { [unowned self] data in
            self.delegate?.didDataModuleNoticeSuccess(self, forBusinessType: self.baseBusiness.type)
        }) { [unowned self] (error) in
            self.delegate?.didDataModuleNoticeFailure(self, forBusinessType: self.baseBusiness.type, errorMesssage: "error")
        }
    
    
        baseBusiness.executeDownload(param: dict, WithHeader: nil, failure: { (error) in
            
            }, completionHandler: { (data) in
                
        }) { (byresRead, totalBytesRead, totalBytesExpectedToRead) in
            
            let a = Double(totalBytesRead)
            let b = Double(totalBytesExpectedToRead)
            
            progress(a/b)
            
        }
        
        
        
        
        
    }
    
}
