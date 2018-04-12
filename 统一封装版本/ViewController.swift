//
//  ViewController.swift
//  统一封装版本
//
//  Created by apple on 2018/4/10.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://api.1school.com.cn:9080/school-evaluation/paper/boxplotRate"
        let param = ["id":"5a60cdf9510140b8c4630304", "gradeExamSetId":"5ac073d31b320d553c377c87", "system":"EVALUATION", "userKey":"ac8fb88462b549a6bcdd621707ee246c"]
        HttpManager.share.post(interface: url, param: param, success: { (result:Any?) in
            print("\(result)")
        }) { (error:Error) in
            print("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

