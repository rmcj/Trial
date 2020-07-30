//
//  MasterControllerView.swift
//  Trial
//
//  Created by Rhiannon Carlson on 7/29/20.
//  Copyright © 2020 Rhiannon Carlson. All rights reserved.
//

import UIKit
import Foundation
import Apollo

class MasterViewController: UITableViewController {
    
    var countries = [CountriesQuery.Data.Country]()
    enum ListSection: Int, CaseIterable {
      case countries
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCountries()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            // No setup is required.
            return
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
        cell.textLabel?.text = country.name
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
