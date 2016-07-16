//
//  VLogin.swift
//  Toan tre em lai
//
//  Created by Thang Le on 7/15/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//

import UIKit

class VLogin: UIViewController {

    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var label_info: UILabel!
    
    var users: NSMutableDictionary = ["nguyenvantu": "123", "nonghoangthai":"khongbiet", "techmaster":"1"]
    // key and value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.navigationBarHidden = true
        // hide the fucking back button
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func button_login(sender: UIButton) {
    
        
        if let password = users[tf_user.text!] {
            if password as! String == tf_password.text!{
                label_info.alpha = 1
                label_info.text = "Dang nhap thanh cong"
                let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewMath") as! ViewController
                self.navigationController?.pushViewController(mainView, animated: true)
            }
            else {
                label_info.alpha = 1
                label_info.text = "Mat khau khong chinh xac"
            }
        }
        else{
            label_info.alpha = 1
            label_info.text = "Tai khoan khong ton tai"
        }
    }
    
    @IBAction func button_generate(sender: UIButton) {
    
        label_info.alpha = 1;
        label_info.text = String(users.allKeys)
    }
    
    @IBAction func button_addaccount(sender: UIButton) {
    
        if let password = users[tf_user.text!]{
            label_info.text = "Tai khoan da ton tai"
        }
        else {
            label_info.alpha = 1
            label_info.text = "Ban da them tai khoan thanh cong"
            users.setValue(tf_password.text!, forKey: tf_user.text!)
        }
    }
    
    @IBAction func button_changepass(sender: UIButton) {
           if let password = users[tf_user.text!] {
            
            label_info.alpha = 1
            label_info.text = "Ban da thay doi mat khau thanh cong"
            users.setValue(tf_password.text!, forKey: tf_user.text!)
            print(users)
            
        }
        
    }
    
    @IBAction func button_del(sender: UIButton) {
        if let password = users[tf_user.text!]{
            label_info.alpha = 1
            label_info.text = " Ban da xoa tai khoan thanh cong"
            users[tf_user.text!] = nil
            users.removeObjectForKey(tf_password!)
        }
        else{
            label_info.alpha = 1
            label_info.text = "Khong the xoa duoc tai khoan"
        }
    }
    
    
}

