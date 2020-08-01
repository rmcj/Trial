//
//  Network.swift
//  Trial
//
//  This file connects to the ApolloClient to access the countries data.
//
//  Created by Rhiannon Carlson on 7/29/20.
//  Copyright © 2020 Rhiannon Carlson. All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
}
