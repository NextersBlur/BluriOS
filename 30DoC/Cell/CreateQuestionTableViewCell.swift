//
//  CreateQuestionTableViewCell.swift
//  30DoC
//
//  Created by Zedd on 2018. 2. 22..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class CreateQuestionTableViewCell: UITableViewCell {

  
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var questionTextfield: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    
    }
    func configure(_ placeholder : String){
        self.questionTextfield.placeholder = nil
        self.questionTextfield.placeholder = placeholder
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func didXButtonTap(_ sender: Any) {
        
    }
    
  
    @IBAction func didOButtonTap(_ sender: Any) {
    }
}
