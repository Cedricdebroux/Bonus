//
//  PeopleCell.swift
//  Bonus
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    static var idenifier = "PeopleCell"
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var filmCollectionView: UICollectionView!
    
    private var people: People!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        filmCollectionView.dataSource = self
        filmCollectionView.delegate = self
        filmCollectionView.register(UINib(nibName: FilmCell.identifier, bundle: .main), forCellWithReuseIdentifier: FilmCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        filmCollectionView.collectionViewLayout = layout
        
    }
    
    func setup(people: People) {
        self.people = people
        
        nameLabel.text = people.name
        birthLabel.text = people.birthYear
        
        filmCollectionView.reloadData()
    }
    
    func film(at indexPath: IndexPath) ->Film? {
        Film.all.first {film in
            film.url == people.films[indexPath.row]
        }
    }
    
}

extension PeopleCell: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        people.films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let film = film(at: indexPath) else { fatalError("Unable to retrive film") }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.identifier, for: indexPath) as! FilmCell
        
        cell.setup(film: film)
        return cell
    }
    
    
}

extension PeopleCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let film = film(at: indexPath)
        else {
            fatalError("Unable to retrive film")
        }
        
        let rect = film.title.boundingRect(with: CGSize(width: 1000, height: 0), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: 17)], context: nil)
        return CGSize(width: rect.width + 24, height: 28)
    }
}
