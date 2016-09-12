//
//  ViewController.swift
//  Micracle Pills
//
//  Created by Michael Dunn on 2016-09-09.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet weak var bt_chooseYourState: UIButton!
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var label_postalcode: UILabel!
    @IBOutlet weak var textfield_postalcode: UITextField!
    
    @IBOutlet weak var label_country: UILabel!
    @IBOutlet weak var textfield_country: UITextField!
    
    @IBOutlet weak var img_success: UIImageView!
    
    @IBOutlet weak var bt_buyNow: UIButton!
    
    var provinces: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        statePicker.delegate = self
        statePicker.dataSource = self
        
        for textField in self.allTextFields {
            textField.delegate = self
        }
        
        provinces = ["Ontario", "Quebec", "Nova Scotia", "New Brunswick", "Manitoba", "British Columbia", "Prince Edward Island", "Saskatchewan", "Albert", "Newfoundland and Labrador"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func handleChooseYourState(_ sender: AnyObject) {
        statePicker.isHidden = !statePicker.isHidden
        
        self.label_country.isHidden = !statePicker.isHidden
        self.textfield_country.isHidden = !statePicker.isHidden
        self.label_postalcode.isHidden = !statePicker.isHidden
        self.textfield_postalcode.isHidden = !statePicker.isHidden
    }
    
    // Remove keyboard when click on empty space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             self.view.endEditing(true)
    }
    
    // Press return on textfield to remove keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Return number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // return number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provinces.count
    }
    
    // return data of row for the component (forcomponent) column
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return provinces[row]
    }
    
    // capture picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bt_chooseYourState.setTitle(provinces[row], for: UIControlState.normal)
        statePicker.isHidden = true
        self.label_country.isHidden = !statePicker.isHidden
        self.textfield_country.isHidden = !statePicker.isHidden
        self.label_postalcode.isHidden = !statePicker.isHidden
        self.textfield_postalcode.isHidden = !statePicker.isHidden

    }
    
    @IBAction func handle_buyNow(_ sender: AnyObject) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
        }
        
        img_success.isHidden = false
    }
    
    
   }

