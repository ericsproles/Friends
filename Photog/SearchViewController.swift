//
//  SearchViewController.swift
//  Photog
//
//  Created by Eric Sproles on 8/5/16.
//  Copyright © 2016 Sprolex. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate
{
    
    @IBOutlet var searchBar: UISearchBar?
    @IBOutlet var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar)
    {
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.text = ""

    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar)
    {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
}
