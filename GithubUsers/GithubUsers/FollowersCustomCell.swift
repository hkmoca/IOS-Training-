//
//  FollowersCustomCell.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 21/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit

class FollowersCustomCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}