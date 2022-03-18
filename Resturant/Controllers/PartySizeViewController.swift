//
//  PartySizeViewController.swift
//  Resturant
//
//  Created by Alex Paul on 3/16/22.
//

import UIKit

class PartySizeViewController: UIViewController {
    
    var partySize = ["1","2","3","4","5"]
    var selectTime: String?
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
extension PartySizeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partySize.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellValue = partySize[indexPath.row]
        guard let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GuestDetailsViewController")
        as? GuestDetailsViewController else { return }
        viewController.selectTime = selectTime
        viewController.partySize = cellValue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath) as! PartySizeTableViewCell
        cell.partySizeLabel.text = partySize[indexPath.row]
        return cell
    }
    

    
}
