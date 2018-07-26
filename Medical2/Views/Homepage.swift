//
//  Homepage.swift
//  Medical2
//
//  Created by Timothy De leon on 7/2/18.
//  Copyright © 2018 Tim. All rights reserved.
//

import UIKit

class Homepage: Medication {

    @IBOutlet weak var medicationList: UITableView!
    @IBOutlet weak var medicationName: UILabel!
    
    var textPassOver : String?
    
    // View did load
    override func viewDidLoad() {
        
        super.viewDidLoad()
        medicationList?.dataSource = self
        medicationName.text = textPassOver
        
        print(itemsArray)
    }
    
    let homeDefaults = UserDefaults.standard
    lazy var itemsArray = defaults.stringArray(forKey: "itemsArray") ?? [String]()
    
    //number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    //whats in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homepageCellReuseID", for: indexPath)
        
        cell.textLabel?.text = itemsArray[indexPath.row]
        return cell
    }
    
    // columns in table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //what happens when you select a cell
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }


}
