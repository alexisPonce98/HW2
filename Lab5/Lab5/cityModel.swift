//
//  cityModel.swift
//  Lab4
//
//  Created by  on 2/23/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import Foundation
class cityModel{
    var name:String = " "
    var desc:String = " "
    var image:String = " "
    init(n:String, d:String, i:String) {
        self.name = n
        self.desc = d
        self.image = i
    }
    
    func getName(city:Int)->String{
        return self.name
    }
    func getImage(city:Int)->String{
        return self.image
    }
    func getDesc(city:Int)-> String{
        return self.desc
    }
    
}
