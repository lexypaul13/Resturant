//
//  SelectTimeViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    func createDatePicker(){
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = .black
        timePicker.minuteInterval = 15
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = .current
    }


}
