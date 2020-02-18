//
//  ViewController.swift
//  Swift_date_format
//
//  Created by Enamul on 2/18/20.
//  Copyright © 2020 HaqueIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label_date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
           var myDate:String = "2020-02-18 04:50:57"
        
        
         //utc_time_add_5hour(myDate: myDate)
          utc_time_to_current_date(myDate: myDate)
        
        //addMinutes()
    }
    
    func addMinutes(){
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm:ss"
        let current_date_time = dateFormatter.string(from: date)
        print("before add time-->",current_date_time)
        
        //adding 5 miniuts
        let addminutes = date.addingTimeInterval(5*60)
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm:ss"
        let after_add_time = dateFormatter.string(from: addminutes)
        print("after add time-->",after_add_time)
        label_date.text = after_add_time
        
    }
    
    func utc_time_add_5hour(myDate:String) -> String {
        var convertedLocalTime:String = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm:ss"
   
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let dt = dateFormatter.date(from: myDate) {
          
            dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
            let dt1 = dateFormatter.string(from: dt)
            
            //add 5 hours
            let date = dt.addingTimeInterval(6*60*60)
         
           convertedLocalTime = dateFormatter.string(from: date)
          
        }
        
        label_date.text = convertedLocalTime
      
        print("convertedLocalTime--",convertedLocalTime)
        
        
        return convertedLocalTime
    }
    
    
    func utc_time_to_current_date(myDate: String) -> String {
        
       // var myDate:String = "2020-02-18 14:30:57"
        var convertedLocalTime:String = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm:ss"
        
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let dt = dateFormatter.date(from: myDate) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
            convertedLocalTime = dateFormatter.string(from: dt)
        } else {
            print("There was an error decoding the string")
        }
        
          label_date.text = convertedLocalTime
        print("convertedLocalTime--",convertedLocalTime)
        
        
        return convertedLocalTime
    }
    
}

