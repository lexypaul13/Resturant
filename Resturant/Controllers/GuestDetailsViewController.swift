//
//  GuestDetailsViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/17/22.
//

import UIKit

class GuestDetailsViewController: UIViewController {

    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var vistorsDetailField: UITextView!
    
    var partySize:String?
    var selectTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if fullNameField.text!.isEmpty && phoneNumberField.text!.isEmpty && vistorsDetailField.text!.isEmpty{
            showAlert()
        } else {
            if let obj = customerDetails.firstIndex(where: {$0.bookingTime == selectTime}) {
                customerDetails[obj] =   CustomerDetail(fullName: fullNameField.text!, phoneNumber: phoneNumberField.text!, visitorsNotes: vistorsDetailField.text!, partySize: Int(partySize!)!, bookingTime: selectTime!, reservation: true, bookTime: Date())
                guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReservationViewController")
                as? ReservationViewController else { return }
                self.navigationController?.pushViewController(viewController, animated: true)
           }
        }
        
    }
    private func showAlert() {
        let alert = UIAlertController(title: "Guest Details", message: "All fields are manadatory.", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
    }
  

}
