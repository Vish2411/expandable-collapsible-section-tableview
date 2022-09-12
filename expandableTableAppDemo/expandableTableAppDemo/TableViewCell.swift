//
//  TableViewCell.swift
//  expandableTableAppDemo
//
//  Created by iMac on 12/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - Outlet Declare
    @IBOutlet weak var labelForData: UILabel!
//    @IBOutlet weak var buttonRightSwipe: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
