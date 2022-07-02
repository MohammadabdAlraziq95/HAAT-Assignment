//
//  PhoneIntroTableViewCell.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class PhoneIntroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryIntroLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func  populateData(_ data: Datum) {
        guard let dailCode = data.dialCode else { return }
        self.countryIntroLabel.text = data.unicodeFlag + " " + dailCode
    }
}
