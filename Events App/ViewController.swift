//
//  ViewController.swift
//  Events App
//
//  Created by Adetunji Dosunmu on 06/12/2017.
//  Copyright © 2017 Adetunji Dosunmu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var eventType: UITextField!
    @IBOutlet weak var eventDrop: UIPickerView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    //create list
    var list = ["Wedding", "Birthday Party", "Graduation Celebration", "Baby Shower", "Anniversary", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(pickerView: UIPickerView, titleforRow row: Int, forComponent component: Int) -> String! {
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component: Int) {
        self.eventType.text = self.list[row]
        self.eventDrop.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
        {
            if textField == self.eventType {
                self.eventDrop.isHidden = false
            }
    }
}

