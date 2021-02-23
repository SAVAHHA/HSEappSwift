//
//  InterestCollectionViewCell.swift
//  HSEapppSwift
//
//  Created by Морев Евгений Александрович on 15.02.2021.
//  Copyright © 2021 Павел Петров. All rights reserved.
//

import Foundation
import UIKit

class InterestCollectionViewCell:UICollectionViewCell
{
    @IBOutlet weak var  featueredImageView: UIButton!
    var interest: Interest! {
        didSet{
            self.updateUI()
        }
        func updateUI(){
        if let interest =interest
        }
    }
}
