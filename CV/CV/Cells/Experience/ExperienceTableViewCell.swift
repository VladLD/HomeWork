//
//  ExperienceTableViewCell.swift
//  CV
//
//  Created by Vlad Lapchynskyi on 06.12.2022.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var experienceImageView: UIImageView!
    @IBOutlet weak var experienceTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
