//
//  planetsHeader.swift
//  Bonus
//
//  Created by Cédric Debroux on 22/08/2022.
//

import UIKit

class PlanetsHeader: UITableViewHeaderFooterView {

    static let identifier = "PlanetsHeader"
 
    @IBOutlet var episodeHeader: UILabel!
    @IBOutlet var titleHeader: UILabel!
    @IBOutlet var directorHeader: UILabel!
    @IBOutlet var backgroundColorV: UIView!
    
    func setupTitle(episode: Film){
        episodeHeader.text = "EPISODE \(episode.episodeId.description)"
        titleHeader.text = episode.title
        directorHeader.text = episode.director
        backgroundColorV.backgroundColor = .black
        episodeHeader.textColor = .white
        titleHeader.textColor = .white
        directorHeader.textColor = .gray
    }
}
