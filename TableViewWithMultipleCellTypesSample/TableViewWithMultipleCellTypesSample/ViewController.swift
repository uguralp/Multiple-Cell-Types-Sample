//
//  ViewController.swift
//  TableViewWithMultipleCellTypesSample
//
//  Created by Uğuralp ÖNBAŞLI on 12.02.2019.
//  Copyright © 2019 Uğuralp ÖNBAŞLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let viewModel = ProfileViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = viewModel
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        
        tableView.register(ProfilePictureTableViewCell.nib, forCellReuseIdentifier: ProfilePictureTableViewCell.identifier)
        tableView.register(InfoTableViewCell.nib, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(MessageBoardTableViewCell.nib, forCellReuseIdentifier: MessageBoardTableViewCell.identifier)

        
        
    }


}

