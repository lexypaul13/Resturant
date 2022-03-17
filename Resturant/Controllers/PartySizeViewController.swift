//
//  PartySizeViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import UIKit

class PartySizeViewController: UIViewController {
    var partySize = ["1","2","3","4","5"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
extension PartySizeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partySize.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath) as! PartySizeTableViewCell
        cell.partySizeLabel.text = partySize[indexPath.row]
        
        return cell
    }
    

    
}
