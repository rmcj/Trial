//
//  MasterControllerView.swift
//  Trial
//
//  This file displays a list of countries. Selecting a country causes
//  a segue to a second page, which displays the selected country's
//  detailed information obtained from an online database.
//  Selecting the ARView navigation bar button causes the AR view to
//  display. The ARView creates a robot that follows the motions of
//  anyone in view of the iOS device's camera.
//
//  Created by Rhiannon Carlson on 7/29/20.
//  Copyright © 2020 Rhiannon Carlson. All rights reserved.
//

import UIKit
import Foundation
import Apollo

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var countries = [CountriesQuery.Data.Country]()
    
    enum ListSection: Int, CaseIterable {
      case countries
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gather the list of countries and details from an online database.
        self.loadCountries()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            // No setup is required.
            return
        }
        
        // Segue to the ViewAR view.
        if segue.identifier == "ShowAR" {
            // No setup is required.
            return
        }
        
        guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {
            // Nothing is selected, nothing to do
            return
        }
        
        guard let listSection = ListSection(rawValue: selectedIndexPath.section) else {
            assertionFailure("Invalid section")
            return
        }
        
        switch listSection {
        case .countries:
            
            // Prepare to segue to the detailed view controller with the selected country's information.
            guard
                let destination = segue.destination as? UINavigationController,
                let detail = destination.topViewController as? DetailViewController else {
                    assertionFailure("Wrong kind of destination")
                    return
            }
            
            // Gather the selected country's data.
            let country = self.countries[selectedIndexPath.row]
                        
            // Set the country's detailed information in the detailed view controller.
            detail.countryInfo = country

        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return ListSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard let listSection = ListSection(rawValue: section) else {
        assertionFailure("Invalid section")
        return 0
      }
            
      switch listSection {
      case .countries:
        return self.countries.count
      }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

      guard let listSection = ListSection(rawValue: indexPath.section) else {
        assertionFailure("Invalid section")
        return cell
      }
        
      switch listSection {
      case .countries:
        let country = self.countries[indexPath.row]
        // Display each country's flag and name in hte list.
        cell.textLabel?.text = country.emoji + country.name
      }
        
      return cell
    }
    
    private func loadCountries() {
      Network.shared.apollo
        .fetch(query: CountriesQuery()) { [weak self] result in
        
          guard let self = self else {
            return
          }

          defer {
            self.tableView.reloadData()
          }
                
          switch result {
          case .success(let graphQLResult):
            if let countryConnection = graphQLResult.data?.countries {
              self.countries.append(contentsOf: countryConnection.compactMap { $0 })
            }
                    
            if let errors = graphQLResult.errors {
              let message = errors
                    .map { $0.localizedDescription }
                    .joined(separator: "\n")
              self.showErrorAlert(title: "GraphQL Error(s)",
                                  message: message)
            }
          case .failure(let error):
            self.showErrorAlert(title: "Network Error",
                                message: error.localizedDescription)
          }
      }
    }
    
    private func showErrorAlert(title: String, message: String) {
      let alert = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default))
      self.present(alert, animated: true)
    }
}
