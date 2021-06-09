//
//  HomeViewController.swift
//  Assignment
//

import UIKit

class HomeViewController: UIViewController {
    var locations = Array<Cordinates>()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locations = LocationSingleton.locations
        tableView.reloadData()
    }
    
    @IBAction func addLocationButtonClk(_ sender: Any) {
        let addLocationViewController = self.storyboard!.instantiateViewController(withIdentifier: "AddLocationViewController") as! AddLocationViewController
        self.navigationController!.pushViewController(addLocationViewController, animated: true)
    }
    
    @IBAction func helpButtonClk(_ sender: Any) {
        let helpViewController = self.storyboard!.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        self.navigationController!.pushViewController(helpViewController, animated: true)
    }
}

extension HomeViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "locationCell")
        let latitude = String(format: "%2f", locations[indexPath.row].lat!)
        let longitude = String(format: "%2f", locations[indexPath.row].lon!)
        tableViewCell?.textLabel?.text = String(format: "Lat: %@      Long: %@", latitude, longitude)
        return tableViewCell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            locations.remove(at: indexPath.row)
            LocationSingleton.locations = locations
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let latitude = locations[indexPath.row].lat
        let longitude = locations[indexPath.row].lat
        
        let cityViewController = self.storyboard!.instantiateViewController(withIdentifier: "CityViewController") as! CityViewController
        cityViewController.location = Cordinates(lat: latitude!, lon: longitude!)
        self.navigationController!.pushViewController(cityViewController, animated: true)
    }
}
