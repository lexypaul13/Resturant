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
        tableViewSetUP()
        // Do any additional setup after loading the view.
    }
    
    func tableViewSetUP(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func createButton(_ sender: Any) {
        performSegue(withIdentifier: "selectTime", sender: sender)
    }
    
    
}

extension ReservationViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  resturant.count
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        return cell
    }
    
    
    
}

