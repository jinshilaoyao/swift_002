//
//  TableViewCell.swift
//  laolin
//
//  Created by yesway on 16/7/5.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var icon: UIImageView! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBOutlet weak var name: UILabel!
    
    var imageIcon: UIImage? {
        willSet {
            let imageScale = (newValue?.size.height)! / (newValue?.size.width)!
            
            icon.bounds = CGRectMake(0, 0, icon.bounds.size.width, imageScale * icon.bounds.size.width)
            
            icon.image = newValue
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
