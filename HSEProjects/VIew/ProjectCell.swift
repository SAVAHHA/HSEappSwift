//
//  ProjectTableViewCell.swift
//  HSEapppSwift
//
//  Created by Petar Perich on 23.04.2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
static let identifier = "ProjectCell"
    
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var recommendedProgramsLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var realisationTimeLabel: UILabel!
    
    @IBOutlet weak var creditsLabel: UILabel!
    
    @IBOutlet weak var leaderLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}

