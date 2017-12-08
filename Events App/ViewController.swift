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
        
        //Setting the span for the map
        let distanceSpan:CLLocationDegrees = 2000
        
        //centre location of the map
        let londonLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(51.5073509, -0.12775829999998223)
        
        //telling the map view to centre on the london location with a span of 2000km
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(londonLocation, distanceSpan, distanceSpan), animated: true)
        
        //reference class for Pin
        let londonPin = LondonAnnotation(title: "Title", subtitle: "Subtitle", coordinate: londonLocation)
        mapView.addAnnotation(londonPin)
        
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

