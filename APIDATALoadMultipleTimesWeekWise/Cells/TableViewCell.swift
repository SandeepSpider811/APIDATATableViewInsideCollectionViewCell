//
//  TableViewCell.swift
//  APIDATALoadMultipleTimesWeekWise
//
//  Created by Sierra 4 on 23/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var lblSubject: UILabel!
    
    @IBOutlet var lblDuration: UILabel!
    
    @IBOutlet var lblEnrolled: UILabel!
    
    @IBOutlet var lblAgeGroup: UILabel!
    
    @IBOutlet var lblCharges: UILabel!
    
    @IBOutlet var lblLocation: UILabel!
    
    @IBOutlet var lineAboveCircleOutlet: UIView!
    
    @IBOutlet var lblTimeFirsPart: UILabel!
    
    @IBOutlet var lblTimeSecondPart: UILabel!
    
    @IBOutlet var lblTimeThirdPart: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //adding shadow to cardView
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        cardView.layer.shadowOpacity = 0.2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
