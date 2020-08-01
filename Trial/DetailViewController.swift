//
//  DetailViewController.swift
//  Trial
//
//  This file displays a selected country's name, native, capital, flag emoji and currency.
//
//  Created by Rhiannon Carlson on 7/31/20.
//  Copyright © 2020 Rhiannon Carlson. All rights reserved.
//

import UIKit
import Apollo

class DetailViewController: UIViewController {
    
    @IBOutlet weak var native: UILabel?
    @IBOutlet weak var capital: UILabel?
    @IBOutlet weak var emoji: UILabel?
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var language: UILabel!
    
    var countryInfo: CountriesQuery.Data.Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title of the view to the name of the country.
        self.title = countryInfo?.name
        
        // Set the values corresponding to the labels.
        native?.text = countryInfo?.native
        capital?.text = countryInfo?.capital
        emoji?.text = countryInfo?.emoji
        currency?.text = countryInfo?.currency
    
    }
}
