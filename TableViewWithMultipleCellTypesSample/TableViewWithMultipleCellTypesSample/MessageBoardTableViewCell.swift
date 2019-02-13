//
//  MeassageBoardTableViewCell.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import UIKit

class MessageBoardTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabelOutlet: UILabel!
    @IBOutlet weak var messageLabelOutlet: UILabel!
    
    var item: Message? {
        didSet {
            if let id = item?.id{
                idLabelOutlet.text = String(id)
            }
            messageLabelOutlet.text = item?.subject
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
