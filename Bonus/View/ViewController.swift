//
//  ViewController.swift
//  Bonus
//
//  Created by Cédric Debroux on 22/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var planetList : [Planet] = [Planet]()
    
    var planet: Planet!
    
    @IBOutlet var planetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        planetTableView.register(UINib(nibName: PlanetsTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: PlanetsTableViewCell.identifier)
        
        planetTableView.register(UINib(nibName: PlanetsHeader.identifier, bundle: .main), forHeaderFooterViewReuseIdentifier: PlanetsHeader.identifier)
        
        planetTableView.dataSource = self
        planetTableView.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndex = planetTableView.indexPathForSelectedRow {
            planetTableView.deselectRow(at: selectedIndex, animated: true)
        }
    }
    
    private func planet(at indexPath: IndexPath) -> Planet? {
        let planetUrl = Film.all[indexPath.section].planets[indexPath.row]
        
        return Planet.all.first { planet in
            planet.url == planetUrl
        }
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let planetHeader =
        tableView.dequeueReusableHeaderFooterView(withIdentifier: PlanetsHeader.identifier) as!
        PlanetsHeader
        let planetTitle = Film.all[section]
        planetHeader.setupTitle(episode: planetTitle)
        
        return planetHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Film.all.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Film.all[section].planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planetCell =
        tableView.dequeueReusableCell(withIdentifier: PlanetsTableViewCell.identifier, for: indexPath) as! PlanetsTableViewCell
        
        let planetUrl = Film.all[indexPath.section].planets[indexPath.row]
        let planet = Planet.all.first { item in
            item.url == planetUrl
        }
        planetCell.setupCell(planet: planet!)
        
        return planetCell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let planet = planet(at: indexPath)
        else{
            fatalError("Unabla to retrive planet")
        }
        
        if planet.residents.isEmpty {
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let planet = planet(at: indexPath)
        else {
            fatalError("unable to retrive planet")
        }
        
        guard let planetVC = storyboard?.instantiateViewController(withIdentifier: "PlanetDetails") as? PlanetViewController
        else {
            fatalError("Unable to instantiate PlanetDetails as PlanetView Controller")
        }
        
        planetVC.planet = planet
        show(planetVC, sender:nil)
        
    }
}
