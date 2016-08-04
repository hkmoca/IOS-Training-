//
//  CustonCell.swift
//  CustonCellTableView
//
//  Created by Héctor Moreno on 04/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class CustonCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
