//
//  searchViewController.swift
//  iDoctor
//
//  Created by mohammed on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

 class searchViewController: UIViewController {
      
     override func viewDidLoad() {
         super.viewDidLoad()
         
         search ()
 }
     func search () {
     let searchController = UISearchController(searchResultsController: nil)
     searchController.searchResultsUpdater = self
     searchController.obscuresBackgroundDuringPresentation = true
     searchController.searchBar.placeholder = "البحث"
         searchController.searchBar.setPlaceholder(textColor: .gray)
         searchController.searchBar.set(textColor: #colorLiteral(red: 0, green: 0.8666666667, blue: 0.4470588235, alpha: 1))
         searchController.searchBar.setTextField(color: UIColor.white)
         searchController.searchBar.setSearchImage(color: .gray)
     searchController.searchBar.tintColor = .white
     
     searchController.searchBar.barTintColor = .white
         searchController.searchBar.borderColor = .white
     self.navigationItem.searchController = searchController
     self.definesPresentationContext = true

     }
     
 }
  extension searchViewController: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {
      print("Searching with: " + (searchController.searchBar.text ?? ""))
      let searchText = (searchController.searchBar.text ?? "")
 //     guard searchText.count > 2 && !searchText.isEmpty else {
 //         return
 //     }
 //     let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
 //     vc.Key = searchText
 //     self.navigationController?.pushViewController(vc, animated: true)
//      searchController.searchBar.text = ""
      }
      
  }
  

