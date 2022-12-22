//
//  ViewController.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 21/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func HrLogin(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "HrLoginViewController") as! HrLoginViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func EmployeeRegistration(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

