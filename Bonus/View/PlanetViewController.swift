//
//  PlanetViewController.swift
//  Bonus
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class PlanetViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var planet: Planet!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = planet.name
        
        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.register(UINib(nibName: PeopleCell.idenifier, bundle: .main), forCellReuseIdentifier: PeopleCell.idenifier)
        
        tableView.register(UINib(nibName: ResidentHeader.identifier, bundle: .main), forHeaderFooterViewReuseIdentifier: ResidentHeader.identifier)

        
    }
    private func resident(at indexPath: IndexPath) -> People? {
        People.all.first { people in
            people.url == planet.residents[indexPath.row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlanetViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planet.residents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resident = resident(at: indexPath)
        else {
            fatalError("Unable to retrive resident")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCell.idenifier, for: indexPath) as? PeopleCell
        else {
            fatalError("Unable to dequeu PeopleCell")
        }
        cell.setup(people: resident)
        return cell
    }
    
    
}

//extension PlanetViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        44
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ResidentHeader.identifier) as? ResidentHeader
//        else {
//            fatalError("Unable to dequeu ResidentsHeader")
//        }
//        headerView.setupTitle(title: "Resident", count: planet.residents.count)
//        return headerView
//    }
//}
