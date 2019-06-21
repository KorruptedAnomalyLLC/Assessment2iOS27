//
//  ItemTableViewCell.swift
//  Assessment2iOS27
//
//  Created by Austin West on 6/21/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

  
    
        
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    
    
    var delegate: ButtonTableViewCell?
    
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
