//
//  ListTableViewCell.swift
//  OLOL
//
//  Created by User on 2017/05/03.
//  Copyright © 2017年 Kanon Kimura. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    

    @IBOutlet weak var listLabel: UILabel!
    
    
    
    @IBAction func backToPink(segue: UIStoryboardSegue) {
    }
    
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
