//
//  WatchListTableViewCell.swift
//  teamFantasy
//
//  Created by David  Bowen on 11/21/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
     var watch: Watch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(_ watch: Watch) {
        self.watch = watch
        name.text = watch.name
       
    }
}
