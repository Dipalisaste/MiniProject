//
//  ListitemsViewController.swift
//  EmployeeDetails
//
//  Created by Felix-ITS015 on 22/09/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import CoreData

class ListitemsViewController: UIViewController {
    
    var technoArr:[String] = ["Java","Android","iOS","Php","Angular","React"]
    var empArrcount:Int = 0
    @IBOutlet weak var listTableView: UITableView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var empArr: [EmployeeData] = []
    var countTech:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.tableFooterView = UIView()
    }
    
    
}


extension ListitemsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return technoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let  obj = technoArr[indexPath.row]
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EmployeeData")
        
        if indexPath.row == 0 {
        request.predicate = NSPredicate(format: "technology = %@", obj)
        do {
            countTech = try  context.count(for: request)
            cell?.textLabel?.text = obj
           cell?.detailTextLabel?.text = String(countTech)
        } catch {
            
            print("Failed")
        }
        
    }
      if indexPath.row == 1 {
            request.predicate = NSPredicate(format: "technology = %@", obj)
            do {
                countTech = try  context.count(for: request)
                cell?.textLabel?.text = obj
                cell?.detailTextLabel?.text = String(countTech)
                
            } catch {
                
                print("Failed")
            }
            
        }
        if indexPath.row == 2 {
            request.predicate = NSPredicate(format: "technology = %@", obj)
            do {
               
                countTech = try  context.count(for: request)
                cell?.textLabel?.text = obj
                cell?.detailTextLabel?.text = String(countTech)
                
            } catch {
                
                print("Failed")
            }
            
        }
        if indexPath.row == 3 {

            request.predicate = NSPredicate(format: "technology = %@", obj)
          
            
            do {
                countTech = try  context.count(for: request)
                cell?.textLabel?.text = obj
                cell?.detailTextLabel?.text = String(countTech)
                
            } catch {
                
                print("Failed")
            }
            
        }
        if indexPath.row == 4 {
            request.predicate = NSPredicate(format: "technology = %@", obj)
            do {
                countTech = try  context.count(for: request)
                cell?.textLabel?.text = obj
                cell?.detailTextLabel?.text = String(countTech)
                
            } catch {
                
                print("Failed")
            }
        }
        if indexPath.row == 5 {
            request.predicate = NSPredicate(format: "technology = %@", obj)
            do {
                countTech = try  context.count(for: request)
                cell?.textLabel?.text = obj
                cell?.detailTextLabel?.text = String(countTech)
                
            } catch {
                
                print("Failed")
            }
            
        }
       return cell!
        }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        if indexPath.row == 0{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.technologyname = "Java"
            navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 1{
           
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.technologyname = "Android"
            navigationController?.pushViewController(vc, animated: true)
            }
        
        if indexPath.row == 2{
        
                let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
           vc.technologyname = "iOS"
            navigationController?.pushViewController(vc, animated: true)
            }
        if indexPath.row == 3{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.technologyname = "Php"
            navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 4{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.technologyname = "Angular"
            navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 5{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.technologyname = "React"
            navigationController?.pushViewController(vc, animated: true)
        }
    
}

}
