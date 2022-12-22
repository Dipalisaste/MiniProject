//
//  HrLoginViewController.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 21/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import Toast_Swift
class HrLoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if usernameTextField.text == /*"snehal@felixtechlabs.com"*/ "a" && passwordTextField.text == /*"Snehal@123"*/ "a"{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ListitemsViewController") as! ListitemsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }else{
            
            self.view.makeToast("Invalid Username & Password")
        }
    
        usernameTextField.text = ""
        passwordTextField.text = ""
}
}
