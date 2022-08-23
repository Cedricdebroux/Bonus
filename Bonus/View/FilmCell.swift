//
//  FilmCell.swift
//  Bonus
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    static let identifier = "FilmCell"
    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 14
       
    }
    
    func setup(film: Film){
        titleLabel.text = film.title
    }

}
