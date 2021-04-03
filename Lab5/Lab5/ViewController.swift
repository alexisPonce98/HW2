//
//  ViewController.swift
//  Lab4
//
//  Created by  on 2/23/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var cityTable: UITableView!
    var cit = [cityModel]()
    var cities = cityModel(n: "Phoenix", d: "Phoenix is one of the hottest cities in the world.", i: "phx.jpg")
    var cities1 = cityModel(n: "San Francisco", d: "San Francisco is home of the hippie movement in the 1960's", i: "sanFran.jpg")
    
    var cities2 = cityModel(n: "San Diego", d: "San Diego is known for the warm beaches and its proximity to Mexico", i: "sanDiego.jpg")
    var cities3 = cityModel(n: "New York City", d: "New York City is known as the city that never sleep", i: "NYC.jpg")
    var cities4 = cityModel(n: "Toronto", d: "Toronto is home of the Toronto Raptors, the only NBA team that is based outside the United States", i: "Toronto.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        cit.append(cities)
        cit.append(cities1)
        cit.append(cities2)
        cit.append(cities3)
        cit.append(cities4)
        // Do any additional setup after loading the view.
    }
    let managedObjectContex = UIAp
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cit.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = cit[indexPath.row].name
        cell.imageView?.image = UIImage(named: cit[indexPath.row].image)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            cit.remove(at: indexPath.row)
            cityTable.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex:IndexPath = self.cityTable.indexPath(for: sender! as! UITableViewCell)!
        let name = cit[selectedIndex.row].name
        let des = cit[selectedIndex.row].desc
        let im = cit[selectedIndex.row].image
        
        if segue.identifier == "detailView"{
            if let ViewController:secondViewController = segue.destination as? secondViewController{
                ViewController.selectString = name
                ViewController.descrip = des
                ViewController.im = im
            }
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Adding a city", message: "Fill out input to add your city", preferredStyle: .alert)
        var action = UIAlertAction(title: "Submit", style: .default){ (aciton) in
            let textField = alert.textFields![0] as UITextField
            let textField1 = alert.textFields![1] as UITextField
            var city:String = " "
            var description:String = " "
            if let x = textField.text{
                city = x
            }
            if let y = textField1.text{
                description = y
            }
            var new:cityModel = cityModel(n: city, d: description, i: "phx.jpg")
            self.cit.append(new)
            self.cityTable.reloadData()
            
        }
        alert.addTextField{(textField) in
            textField.placeholder = "City Name"
        }
        alert.addTextField{ (textField1) in textField1.placeholder = "City Description"}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
 
    @IBAction func cancel(_ sender: Any) {
        let alert = UIAlertController(title: "DELETE", message: "In order to Delete, Left swipe on the city and select Delete", preferredStyle: .alert)
        var alertA = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertA)
        self.present(alert, animated: true, completion: nil)
    }
    
}

