//
//  getDataModuel.swift
//  laolin
//
//  Created by yesway on 16/6/30.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class getDataModuel: BaseDataModuel {
    
    
    func get() {
        baseBusiness = creatBusinessWithType(.businessType_get)
        
        let dict = ["user":"jinshilaoyao"]
        
        baseBusiness.execute(param: dict, WithHeader: nil, completionHandler: { [unowned self] data in
            self.delegate?.didDataModuleNoticeSuccess(self, forBusinessType: self.baseBusiness.type)
        }) { [unowned self] (error) in
            self.delegate?.didDataModuleNoticeFailure(self, forBusinessType: self.baseBusiness.type, errorMesssage: "error")
        }
    }

}
