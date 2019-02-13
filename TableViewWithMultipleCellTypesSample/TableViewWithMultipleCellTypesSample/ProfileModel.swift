//
//  ProfileModel.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import Foundation
import UIKit

class Message{
    var id:Int,
    subject:String
    
    init(id:Int, subject:String) {
        self.id = id
        self.subject = subject
    }
}

class Profile{
    var fullName: String,
    image:UIImage,
    info:String,
    messages:[Message]
    
    init(fullName:String, image:UIImage, info:String, messages:[Message]) {
        self.fullName = fullName
        self.image = image
        self.info = info
        self.messages = messages
    }
    
    func addMessages(){
        for i in 1...10{
            self.messages.append(Message(id: i, subject: "Lorem ipsum dolor sit"))
        }
    }
}
