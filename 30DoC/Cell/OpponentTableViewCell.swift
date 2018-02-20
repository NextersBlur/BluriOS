//
//  OpponentTableViewCell.swift
//  30DoC
//
//  Created by Zedd on 2018. 2. 19..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class OpponentTableViewCell: UITableViewCell {

    @IBOutlet weak var chatView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        chatView.layer.cornerRadius = 3.0
        let maskPath = UIBezierPath(roundedRect: chatView.bounds,
                                    byRoundingCorners: [.topLeft, .topRight, .bottomLeft],
                                    cornerRadii: CGSize(width: 18.0, height: 0.0))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        chatView.layer.mask = maskLayer
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
