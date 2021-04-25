//
//  ProjectDetailViewController.swift
//  HSEapppSwift
//
//  Created by Petar Perich on 25.04.2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    @IBOutlet weak var nameDetailLabel: UILabel!
    
    @IBOutlet weak var deadlineDetailLabel: UILabel!
    
    var projectItem: ProjectStudents!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        // Do any additional setup after loading the view.
    }
    private func configure(){
        nameDetailLabel.text = projectItem.name
        deadlineDetailLabel.text = "Срок записи:" + " " + projectItem.deadline
    }

}
