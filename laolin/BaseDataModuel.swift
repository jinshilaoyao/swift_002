//
//  BaseDataModuel.swift
//  laolin
//
//  Created by yesway on 16/6/30.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit


protocol netWorkresutlDataModelDelegate {
    
    func didDataModuleNoticeSuccess(baseData: BaseDataModuel, forBusinessType type:businessType)
    
    func didDataModuleNoticeFailure(baseData: BaseDataModuel, forBusinessType type:businessType, errorMesssage: String)
}


class BaseDataModuel: NSObject {
    
    var baseBusiness: BaseBusiness = BaseBusiness()
    
    var delegate: netWorkresutlDataModelDelegate?
    
    func creatBusinessWithType(type: businessType) -> BaseBusiness{
        return baseBusiness.creatBusiness(type) ?? baseBusiness
    }
}
