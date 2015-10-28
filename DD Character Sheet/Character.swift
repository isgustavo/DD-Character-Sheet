//
//  Character.swift
//  DD Character Sheet
//
//  Created by gustavo.freitas2 on 9/1/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import Foundation

class Character: NSObject, NSCoding {

    var name: String?
    var classType: String?
    var race: String?
    var trend: String?
    var divinity: String?
    var level: Int?
    var size: Float?
    var age: Int?
    var sex: String?
    var height: Float?
    var weight: Float?
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.classType = aDecoder.decodeObjectForKey("class") as? String
        self.race = aDecoder.decodeObjectForKey("race") as? String
        self.trend = aDecoder.decodeObjectForKey("trend") as? String
        self.divinity = aDecoder.decodeObjectForKey("divinity") as? String
        self.level = aDecoder.decodeObjectForKey("level") as? Int
        self.size = aDecoder.decodeObjectForKey("size") as? Float
        self.age = aDecoder.decodeObjectForKey("age") as? Int
        self.sex = aDecoder.decodeObjectForKey("sex") as? String
        self.height = aDecoder.decodeObjectForKey("height") as? Float
        self.weight = aDecoder.decodeObjectForKey("weight") as? Float
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(classType, forKey: "class")
        aCoder.encodeObject(race, forKey: "race")
        aCoder.encodeObject(trend, forKey: "trend")
        aCoder.encodeObject(divinity, forKey: "divinity")
        aCoder.encodeObject(level, forKey: "level")
        aCoder.encodeObject(size, forKey: "size")
        aCoder.encodeObject(age, forKey: "age")
        aCoder.encodeObject(sex, forKey: "sex")
        aCoder.encodeObject(height, forKey: "height")
        aCoder.encodeObject(weight, forKey: "weight")
        
    }
    
    
}
