//
//  secondViewController.swift
//  Lab4
//
//  Created by  on 2/23/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var
    selectedCity: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    var im:String = " "
    var selectString = " "
    var descrip:String = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCity.text = selectString
        desc.text = descrip
        image.image = UIImage(named: im)
        // Do any additional setup after loading the view.
    }
    

   
    
    
}
