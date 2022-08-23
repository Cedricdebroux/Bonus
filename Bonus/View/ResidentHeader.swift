//
//  ResidentHeader.swift
//  Bonus
//
//  Created by Cédric Debroux on 22/08/2022.
//

import UIKit

class ResidentHeader: UITableViewHeaderFooterView {
    
    static let identifier = "ResidentHeader"
    
    @IBOutlet var residentNameLabel: UILabel!
    
    @IBOutlet var residentBirthYear: UILabel!
    
    func setupTitle(title: String, count: Int){
        residentNameLabel.text = title
        residentBirthYear.text = count.description
    }

}
