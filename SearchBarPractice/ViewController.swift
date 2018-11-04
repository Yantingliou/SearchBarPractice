//
//  ViewController.swift
//  SearchBarPractice
//
//  Created by 劉彥廷 on 2018/11/4.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var searchDataArray = [String]()
    var searchChange = false
    
    @IBOutlet weak var useTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
    }

    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchChange {
            return searchDataArray.count
        } else{
            return dataClass.dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        if searchChange {
         cell?.textLabel?.text = searchDataArray[indexPath.row]
        } else {
            cell?.textLabel?.text = dataClass.dataArray[indexPath.row]
        }
        
        return cell!
        
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchDataArray = dataClass.dataArray.filter({$0.prefix(searchText.count) == searchText })
        searchChange = true
        useTableview.reloadData()
    }
}

