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
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        if customerDetails.reservation {
        cell.availableLabel.text = "not availbe"
        } else {
            cell.availableLabel.text = ""
        }
        return cell
    }
    
}
