//
//  FavoritesCardTableViewCell.swift
//  News
//
//  Created by Vlad Lapchynskyi on 29.11.2022.
//

import UIKit

class FavoritesCardTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var textStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainStackView.layer.cornerRadius = 8
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 18, left: 18, bottom: 16, right: 18)
        
        textStackView.isLayoutMarginsRelativeArrangement = true
        textStackView.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func addData(favourite: Favourite) {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-YYYY, HH:mm"
        
        titleLabel.text = favourite.title
        descLabel.text = favourite.newsDescription
        dateLabel.text = df.string(from: favourite.creationDate)
        newImageView.image = favourite.icon
    }
}
