//
//  ExperienceListTableViewCell.swift
//  CV
//
//  Created by Vlad Lapchynskyi on 06.12.2022.
//

import UIKit

class ExperienceListTableViewCell: UITableViewCell {

    @IBOutlet weak var yearOfWorkTitleLabel: UILabel!
    @IBOutlet weak var companyTitleLabel: UILabel!
    @IBOutlet weak var specialityTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
