//
//  MyTeamTableViewCell.swift
//  teamFantasy
//
//  Created by Sean Crowl on 11/18/16.
//  Copyright © 2016 David  Bowen. All rights reserved.
//

import UIKit

class MyTeamTableViewCell: UITableViewCell {
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var helmetImage: UIImageView!
    
    
    weak var team: Team!
    weak var teamcell: MyTeamTableViewCell!
    
    var isComplete: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(team: Team) {
        self.team = team
        playerNameLabel.text! = team.title
        teamLabel.text! = team.team
        helmetImage.image = team.helmet
        
    }
    
}
