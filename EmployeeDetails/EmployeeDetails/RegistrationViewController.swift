//
//  RegistrationViewController.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 21/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import CoreData
import  Toast_Swift
class RegistrationViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var technoTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
 
    var list = ["Java","Android","iOS","Php","Angular","React"]
    var pickerView = UIPickerView()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        technoTextField.inputView = pickerView
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return list.count
}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        technoTextField.text = list[row]
        technoTextField.resignFirstResponder()
    }
    @IBAction func saveRegisterButton(_ sender: UIButton) {
        
        let emp = EmployeeData(context: context)
        emp.firstname = firstNameTextField.text
        emp.lastname = lastNameTextField.text
        emp.technology = technoTextField.text
        if (emailTextField.text?.isValidEmail)!{
        self.view.makeToast("Email is valid")
            emp.email = emailTextField.text
        }else{
        self.view.makeToast("Invalid Email ")
        }
        if(phoneTextField.text?.isPhoneNumber)!{
        
          self.view.makeToast("phone number is valid")
            emp.phone = Int64(phoneTextField.text!)!
        }else{
            
            self.view.makeToast("phone number is not valid")
        }
        
        do{
           try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
        firstNameTextField.text?.removeAll()
        lastNameTextField.text?.removeAll()
        emailTextField.text?.removeAll()
        technoTextField.text?.removeAll()
        phoneTextField.text?.removeAll()
    
    }
}
extension String{
    var isValidEmail:Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
}
    var isPhoneNumber:Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count && self.characters.count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
