//
//  DetailViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/17/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var partyNumber: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var vistorsDetail: UITextView!
    
    var name: String?
    var phoneNumber: String?
    var notes: String?
    var partySize:Int?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        // Do any additional setup after loading the view.
    }
    
    func setUpLabels(){
        fullNameLabel.text = name
        partyNumber.text = "\(partySize ?? 0)"
        timeLabel.text = time
        phoneNumberLabel.text = phoneNumber
        vistorsDetail.text = notes
    }
    
    
    @IBAction func closeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
