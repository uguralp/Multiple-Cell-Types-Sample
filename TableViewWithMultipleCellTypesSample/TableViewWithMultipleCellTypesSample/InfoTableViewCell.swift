//
//  InfoTableViewCell.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabelOutlet: UITextView!
    
    var item: ProfileViewModelItem? {

        didSet {
            guard let item = item as? ProfileViewModelAbout else {
                return
            }
            
            infoLabelOutlet.text = item.about
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
