//
//  ViewController.swift
//  NotfiactionTestDemo
//
//  Created by 宁国通 on 2017/1/19.
//  Copyright © 2017年 宁国通. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showPostDataLabel: UILabel!
    @IBOutlet weak var postNameField: UITextField!
    @IBOutlet weak var removeNameField: UITextField!
    
    
    /// 移除所有通知
    @IBAction func removeAllNotfiactionAction(_ sender: UIButton) {
        NotificationUtils.share.removeAllNotification()
        textViewShow()
    }
 
    /// 移除指定通知
    @IBAction func removeNotfiactionByNameAction(_ sender: UIButton) {
        NotificationUtils.share.removeNotification(self.removeNameField.text!)
        textViewShow()
    }
    
    /// 发送数据通知
    @IBAction func postAction(_ sender: UIButton) {
        //设置通知，添加过的通知不会重复添加
        NotificationUtils.share.setNotification(self, self.postNameField.text!, selector: #selector(ViewController.notfiaction(notification:)),object: nil)
        NotificationUtils.share.postNotification(self.postNameField.text!, object: nil, userInfo: ["testTmp":"\(RandomUtils.createRandomMan(start: 1, end: 1000))"])
    }
    
    
    /// 通知执行函数
    @objc func notfiaction(notification:Notification){
        textViewShow()
        self.showPostDataLabel.text = notification.userInfo?.description ?? ""
        print(notification.userInfo?.description ?? "没有获取到值")
    }
    
    
    @IBOutlet weak var textview: UITextView!
    
    fileprivate func textViewShow(){
        var txt:[String] = []
        for d in NotificationUtils.share.notificationArray {
            txt.append("通知名称:\(d.notificationName!)")
        }
        textview.text = txt.description
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

