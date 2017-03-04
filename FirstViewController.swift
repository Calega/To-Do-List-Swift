//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lucas Calegari on 04/03/17.
//  Copyright © 2017 Lucas Calegari. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        var cellLabel = ""
        
        if let tempLabel = items[indexPath.row] {
            
            cellLabel = tempLabel
            
        }

        cell.textLabel?.text = cellLabel
        
        return cell
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

