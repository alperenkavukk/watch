//
//  watchhViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 3.03.2023.
//

import UIKit

class watchhViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //cell.textLabel?.text = search[indexPath.row].originalTitle.capitalized
        return cell
    }
    
    
    


   
}
