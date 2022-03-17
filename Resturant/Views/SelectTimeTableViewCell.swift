//
//  SelectTimeTableViewCell.swift
//  Resturant
//
//  Created by Alex Paul on 3/17/22.
//

import UIKit

class SelectTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var selectTimeLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
