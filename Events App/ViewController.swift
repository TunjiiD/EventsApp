//
//  ViewController.swift
//  Events App
//
//  Created by Adetunji Dosunmu on 06/12/2017.
//  Copyright © 2017 Adetunji Dosunmu. All rights reserved.
//

import UIKit
import MapKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    //contact us page text fields
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var eventType: UITextField!
    @IBOutlet var eventDrop: UIPickerView!
    @IBOutlet var eventDateField: UITextField!
    @IBOutlet var attendeesField: UITextField!
    @IBOutlet var serviceField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var notesField: UITextView!
    
    
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
    
    //button for contact us page
    @IBAction func Submit(_ sender: Any) {
        
        //configure mail view controller over application and populate email
        let toRecipients = ["adesa@hotmail.co.uk"]
        
        //mail compose view controler
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipients)
        mc.setSubject(nameField.text!)
        mc.setMessageBody("Name: \(nameField.text!) \n\nEmail: \(emailField.text!) \n\nPhone_Number: \(phoneField.text!) \n\nEvent_Type: \(eventType.text!), \n\nEvent_Date_Field: \(eventDateField.text!) \n\nAttendees: \(attendeesField.text!) \n\nService: \(serviceField.text!) /n/nNotes: \(notesField.text!)", isHTML: false)
        self.present(mc, animated: true, completion: nil)
    }
    
    //to come out of mail window
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        default:
            break
        }
        
        //dissmiss view and go back to application
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //dismiss keyboard on lower iOS versions
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        
        self.resignFirstResponder()
    }
    
    

}

