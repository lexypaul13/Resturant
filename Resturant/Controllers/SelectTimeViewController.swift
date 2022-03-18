//
//  SelectTimeViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import UIKit
class SelectTimeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUP()
        // Do any additional setup after loading the view.
    }
    func tableViewSetUP(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
extension SelectTimeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerDetails.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = customerDetails[indexPath.row].bookingTime
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PartySizeViewController")
                as? PartySizeViewController else { return }
        viewController.selectTime = cell
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! SelectTimeTableViewCell
        var customerDetails = customerDetails[indexPath.row]
        cell.selectTimeLabel.text = customerDetails.bookingTime
        if let date = customerDetails.bookTime {
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            if minutes > 60 {
                cell.availableLabel.text = ""
                customerDetails.reservation = false
                
            }
        }
        if customerDetails.reservation {
            cell.availableLabel.text = "Not Available"
        } else {
            cell.availableLabel.text = "Available"
        }
        return cell
    }
    
}
