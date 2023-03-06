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

        getPopularData {
            print("completed")
            self.tableView.reloadData()
        }
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
    
    
    


    func getPopularData(completed: @escaping () -> ()){
        let url = URL(string: "https://api.themoviedb.org/3/movie/343611?api_key=d8cc792aeb02fbe6d958a6c58a962a59")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                 
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as!  Dictionary<String , Any>
                    
                    DispatchQueue.main.async {
                        print(jsonResponse)
                        completed()
                    }
                }catch {
                    print("erorrrr")
                }
            }
        }.resume()
          
    }
}
