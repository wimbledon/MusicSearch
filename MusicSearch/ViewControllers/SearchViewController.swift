//
//  SearchViewController.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class SearchViewController: UISearchController {
    
    var searchKeywordsUpdator = SearchKeywordsUpdator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchResultsUpdater = searchKeywordsUpdator
    }
}
