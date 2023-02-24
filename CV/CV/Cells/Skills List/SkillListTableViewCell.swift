//
//  SkillListTableViewCell.swift
//  CV
//
//  Created by Vlad Lapchynskyi on 06.12.2022.
//

import UIKit

class SkillListTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var mainVStackView: UIStackView!
    @IBOutlet private weak var mainHStackView: UIStackView!

    var skills = [Skill]() {
        didSet {
            refresh()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func refresh() {
        mainHStackView.arrangedSubviews.forEach {
            mainHStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        skills.forEach { skill in
            
            let skillImageView = UIImageView()
            skillImageView.image = skill.image
            
            
            let skillNameLabel = UILabel()
            skillNameLabel.text = skill.name
            
            let imageViews = (0..<skill.level).map { _ in
                let imageView = UIImageView()
                imageView.image = UIImage(named: "icon.star")
                return imageView
            }
            
            let skillLevelStackView = UIStackView()
            skillLevelStackView.axis = .horizontal
            skillLevelStackView.spacing = 2
            imageViews.forEach(skillLevelStackView.addArrangedSubview)
            
            
            let skillStackView = UIStackView()
            skillStackView.axis = .vertical
            skillStackView.alignment = .center
            skillStackView.spacing = 5
            
            skillStackView.addArrangedSubview(skillImageView)
            skillStackView.addArrangedSubview(skillNameLabel)
            skillStackView.addArrangedSubview(skillLevelStackView)
            
            mainHStackView.addArrangedSubview(skillStackView)
        }
    }
    
}

