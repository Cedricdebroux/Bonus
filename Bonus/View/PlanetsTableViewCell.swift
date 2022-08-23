//
//  PlanetsTableViewCell.swift
//  Bonus
//
//  Created by Cédric Debroux on 22/08/2022.
//

import UIKit

class PlanetsTableViewCell: UITableViewCell {
    
    static let identifier = "PlanetsTableViewCell"
    
    @IBOutlet var planetName: UILabel!
    
    @IBOutlet var planetTemp: UIImageView!
    
    @IBOutlet var planetClimat: UILabel!
    
    @IBOutlet var nbResident: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(planet: Planet){
        planetName.text = planet.name
        planetClimat.text = planet.climate
        nbResident.text = planet.residents.count.description
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
