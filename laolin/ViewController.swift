//
//  ViewController.swift
//  laolin
//
//  Created by yesway on 16/6/28.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ViewController: UIViewController,netWorkresutlDataModelDelegate {
    
//    let mbp = MBProgressHUD(

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBOutlet weak var progess: UIProgressView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
    let add = addDataModuel()
    let delete = deleteDataModuel()
    let get = getDataModuel()
    let download = downloadDataModuel()
    
    @IBAction func add(sender: UIButton) {
        add.delegate = self;
        add.add()
    }
    @IBAction func deleteOnClikc(sender: UIButton) {
        delete.delegate = self;
        delete.deleteModel()
    }
    @IBAction func get(sender: UIButton) {
        get.delegate = self;
        get.get()
    }
    @IBAction func download(sender: UIButton) {
        download.delegate = self;
        
        download.download { (progress) in
            
            self.progess.progress = Float(progress)
            
        }
        
    }
    func didDataModuleNoticeSuccess(baseData: BaseDataModuel, forBusinessType type: businessType) {
        
        if type == .businessType_add {
            print(baseData)
        }
        if type == .businessType_get {
            print(baseData)
        }
        if type == .businessType_delete {
            print(baseData)
        }
        if type == .businessType_download {
            
        }
        
        
    }
    func didDataModuleNoticeFailure(baseData: BaseDataModuel, forBusinessType type: businessType, errorMesssage: String) {
        if type == .businessType_add {
            print(errorMesssage)
        }
    }
}
