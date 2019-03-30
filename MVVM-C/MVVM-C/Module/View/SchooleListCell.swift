//
//  SchooleListCell.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class SchooleListCell: UITableViewCell, ReusableView, NibLoadableView {

    var viewModel: SchoolViewModel? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI() {
        lblTitle.text = viewModel?.schoolTitle
        lblDescription.text = viewModel?.schoolDescription
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = nil
        lblDescription.text = nil
    }
}
