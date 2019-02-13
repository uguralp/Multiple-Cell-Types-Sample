//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import Foundation
import UIKit

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case messages
}


protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class ProfileViewModelNameAndPicture: ProfileViewModelItem {
    var type: ProfileViewModelItemType{ return .nameAndPicture}
    
    var sectionTitle:String { return "Profile"}
    
    var rowCount: Int { return 1 }
    
    var image:UIImage, name:String
    
    init(image:UIImage, name:String) {
        self.image = image
        self.name = name
    }
}

class ProfileViewModelAbout: ProfileViewModelItem {
    var type: ProfileViewModelItemType { return .about}
    
    var sectionTitle:String { return "About" }
    
    var rowCount: Int { return 1 }
    
    var about:String
    
    init(about:String) {
        self.about = about
    }
}

class ProfileViewModelMessages: ProfileViewModelItem {
    var type: ProfileViewModelItemType {return .messages}
    var sectionTitle: String {return "Messages"}
    var rowCount: Int { return message.count }
    
    var message:[Message]
    
    
    init(message:[Message]) {
        self.message = message
    }
}

class ProfileViewModel: NSObject  {
    var items = [ProfileViewModelItem]()
    var myProfile = Profile(fullName: "Michael Jackson", image: UIImage(named: "MJ.jpg")!, info: "Hi everyone!", messages: [Message]())
    
    override init() {
        super.init()
        
        myProfile.addMessages()
        
            let nameAndPicture = ProfileViewModelNameAndPicture(image: myProfile.image, name: "Michael Joseph Jackson was an American singer, songwriter and dancer. Dubbed the King of Pop, he is regarded as one of the most significant cultural icons of the 20th century and one of the greatest entertainers of all time.")
            items.append(nameAndPicture)
        
        let aboutItem = ProfileViewModelAbout(about: myProfile.info)
        items.append(aboutItem)
        
        let messagesItem = ProfileViewModelMessages(message: myProfile.messages)
        items.append(messagesItem)
        
    }
}

extension ProfileViewModel: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePictureTableViewCell.identifier, for: indexPath) as? ProfilePictureTableViewCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell {
                cell.item = item
                return cell
            }
        case .messages:
            if let item = item as? ProfileViewModelMessages, let cell = tableView.dequeueReusableCell(withIdentifier: MessageBoardTableViewCell.identifier, for: indexPath) as? MessageBoardTableViewCell {
                let messages = item.message[indexPath.row]
                cell.item = messages
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
    
    
    
}
