//
//  ViewController.swift
//  Medical2
//
//  Created by Timothy De leon on 6/24/18.
//  Copyright © 2018 Tim. All rights reserved.
//

import UIKit

class Medication: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var itemsArrayControls = ["Med1" , "Med2"]
    let defaults = UserDefaults.standard
    
    // View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        frequencyPickerView.delegate = self
        frequencyPickerView.dataSource = self
        frequencyText?.inputView = frequencyPickerView
        tableView?.dataSource = self
    }
    
    // Save Button
    @IBAction func saveButton(_ sender: Any) {
        
        defaults.set(itemsArrayControls, forKey: "itemsArray")
        
        performSegue(withIdentifier: "saveSegue", sender: self)
//       var units = unitsText.text!
//        frequency = frequencyText.text!
//    if dosageText.text! == "" {
//    print("nil")
//    } else {
//    newItem.dosage = Double(dosageText.text!)!
//    print(dosage)
//    }
//    print(nameMedText.text!)
//    print(nameMedicine)
//    print(frequency)
//    print(numberOfTimes)
    }
    
    // declares segue, adds to array
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue" {
            

            let destinationVC = segue.destination as! Homepage
            destinationVC.textPassOver = nameMedText.text
            
            if let items = UserDefaults.standard.array(forKey: "itemsArray") as? [String] {
                destinationVC.itemsArray = items
                 itemsArrayControls.append(nameMedText.text!)
            }
            
            self.tableView.reloadData()
            print("itemsarraycontrols: \(itemsArrayControls)")
        }
    }
    
//******************************************************************************************************************
    
    var frequencyArray = ["pill1" , "pill2" ]//[Item]()
    var frequencies : [String] = ["As Needed", "Daily", "Monthly"]
    var frequencyPickerView = UIPickerView()
    var nameMedicine : String = ""
    var dosage : Double = 0
    var units : String = ""
    var frequency : String = ""
    var numberOfTimes : Int = 0
    
    @IBOutlet weak var nameMedText: UITextField!
    @IBOutlet weak var dosageText: UITextField!
    @IBOutlet weak var unitsText: UITextField!
    @IBOutlet weak var frequencyText: UITextField!
    @IBOutlet weak var numberOfTimesText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // Click out to exit text field keyboards
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameMedText.resignFirstResponder()
        dosageText.resignFirstResponder()
        unitsText.resignFirstResponder()
        frequencyText.resignFirstResponder()
        numberOfTimesText.resignFirstResponder()

        if numberOfTimesText.text! != "" {
            numberOfTimes = Int(numberOfTimesText.text!)! } else {
            print("number of times = nil")
        }
    }
    
    //Picker view methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return frequencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return frequencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        frequencyText.text = frequencies[row]
    }
    
    // Table view methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frequencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        cell.textLabel?.text = frequencyArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("where alarm is set")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

    



