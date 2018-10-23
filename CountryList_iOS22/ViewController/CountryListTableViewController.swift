//
//  CountryListTableViewController.swift
//  CountryList_iOS22
//
//  Created by Ivan Ramirez on 10/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class CountryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
       
        
        CountryCountroller.shared.fetchCountries { (countries, error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CountryCountroller.shared.countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounryCell", for: indexPath)
        
        let country = CountryCountroller.shared.countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = "Population Size: \(country.population)"
        return cell
    }
}
