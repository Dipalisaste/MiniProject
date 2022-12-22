//
//  DetailViewController.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 22/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    

    
    var technologyname:String = ""
    @IBOutlet weak var detailTableView: UITableView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var empArr: [EmployeeData] = []
    var countTech:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.reloadData()
        detailTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchEmpData()
    }
    func fetchEmpData() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EmployeeData")
        
       request.predicate = NSPredicate(format: "technology = %@", technologyname)
        
        request.returnsObjectsAsFaults = false
    
        do {
            let result = try context.fetch(request)
            empArr = result as! [EmployeeData]
        } catch {
            
            print("Failed")
        }
        
}
    
}
extension DetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        let  obj = empArr[indexPath.row]
        cell?.textLabel?.text = obj.firstname
        cell?.detailTextLabel?.text = obj.technology
        return cell!
    }
}
