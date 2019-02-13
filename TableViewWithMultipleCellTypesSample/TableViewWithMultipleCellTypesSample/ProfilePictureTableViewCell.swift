//
//  ProfilePictureTableViewCell.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import UIKit

class ProfilePictureTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    var item: ProfileViewModelItem? {

        didSet {
            guard let item = item as? ProfileViewModelNameAndPicture else {
                return
            }
         
            profilePicImageView.image = item.image
            
            nameLabelOutlet.text = item.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}
