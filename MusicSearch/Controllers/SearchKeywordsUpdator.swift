//
//  SearchKeywordsUpdator.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class SearchKeywordsUpdator : NSObject, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let resultsVC = searchController.searchResultsController as? SearchResultsViewController {
            if let keywords = searchController.searchBar.text, keywords.count > 0 {
                DZAPIClient.searchKeywords(keywords) { (artists, error) in
                    DispatchQueue.main.async {
                        if keywords == searchController.searchBar.text {
                            resultsVC.reloadArtists(artists: artists)
                        }
                    }
                }
            }
            else {
                resultsVC.reloadArtists(artists: nil)
            }
        }
    }
}
