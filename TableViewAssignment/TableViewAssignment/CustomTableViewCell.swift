//
//  CustomTableViewCell.swift
//  TableViewAssignment
//
//  Created by Ruslan Amrayev on 13.11.2025.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    func configure(with item: FavoriteItem) {
        itemImageView.image = item.image
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
    }
}
