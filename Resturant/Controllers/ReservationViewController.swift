//
//  ViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import UIKit

class ReservationViewController: UIViewController {
    
    var resturant = [CustomerDetail]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let filtered = customerDetails.filter { $0.reservation == true }
        resturant = filtered
        tableViewSetUP()
        // Do any additional setup after loading the view.
    }
    
    func tableViewSetUP(){
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func createButton(_ sender: Any) {
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectTimeViewController")
        as? SelectTimeViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}

extension ReservationViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  resturant.count
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReservationTableViewCell
        let custom = resturant[indexPath.row]
        if custom.reservation {
            cell.customerNameLabel.text = custom.fullName
            cell.partySizeLabel.text = "\(custom.partySize)"
            cell.resrvationTimeLabel.text = custom.bookingTime
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = resturant[indexPath.row]
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")
        as? DetailViewController else { return }
        viewController.notes = cell.visitorsNotes
        viewController.phoneNumber = cell.phoneNumber
        viewController.partySize = cell.partySize
        viewController.name = cell.fullName
        viewController.time =  cell.bookingTime
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

