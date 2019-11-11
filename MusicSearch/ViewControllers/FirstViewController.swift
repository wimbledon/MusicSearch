//
//  FirstViewController.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let searchVC = SearchViewController(searchResultsController: SearchResultsViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchVC
    }
}
