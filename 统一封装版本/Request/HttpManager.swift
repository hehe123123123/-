//
//  HttpManager.swift
//  统一封装版本
//
//  Created by apple on 2018/4/11.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
import AFNetworking

class HttpManager: NSObject {
    
    static let share = HttpManager()
    
    typealias successBlock = (Any?)->()
    typealias failurBlock = (Error)->()
    
    let manager = AFHTTPSessionManager()
    
    override init() {
        super.init()
        let securityPolicy = AFSecurityPolicy.default()
        securityPolicy.allowInvalidCertificates = false
        
        manager.responseSerializer.acceptableContentTypes = nil
        manager.securityPolicy = securityPolicy
        
        let s = 2
    }
    
    func post(interface:String, param:Dictionary<String,Any>, success:@escaping successBlock, failur:@escaping failurBlock) -> Void {
        
        printUrl(interface: interface, param: param)
        
        manager.post(interface, parameters: param, progress: { (progress:Progress) in
            
        }, success: { (dataTask:URLSessionDataTask, any:Any?) in
            success(any)
        }) { (dataTask:URLSessionDataTask?, error:Error) in
            failur(error)
        }
    }
    
    func printUrl(interface:String, param:Dictionary<String,Any>) -> Void {
        var url = interface
        var i = 0
        for key in param.keys {
            let value:String = param[key] as! String
            if i == 0 {
                url += "?\(key)=\(value)"
            } else {
                url += "&\(key)=\(value)"
            }
            i += 1
        }
        print(url)
    }
}
