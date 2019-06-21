//
//  ItemTableViewCell.swift
//  Assessment2iOS27
//
//  Created by Austin West on 6/21/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    fileprivate func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
}

extension ButtonTableViewCell {
    func update(withItem item: Item) {
        
        primaryLabel = item.name
        updateButton(item.isComplete)
    }
}

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
