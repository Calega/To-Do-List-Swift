//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lucas Calegari on 04/03/17.
//  Copyright © 2017 Lucas Calegari. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items:NSMutableArray = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        var cellLabel = ""
        
        if let tempLabel = items[indexPath.row] as? String {
            
            cellLabel = tempLabel
            
        }

        cell.textLabel?.text = cellLabel
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
    
        if let tempItems = itemObject as? NSMutableArray {
            
            items = tempItems
            
        } 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

