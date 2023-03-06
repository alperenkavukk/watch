//
//  searchTabBarViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 4.03.2023.
//

import UIKit

class searchTabBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var fetchedMovie = [Result]()
    var filtreliData = [Result]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "Search..."
        
    
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            self.tableview.reloadData()
        } else
        {
            isSearching = true
            filtreliData = fetchedMovie.filter({($0["result"] as! String).lowercased().contains(searchText.lowercased())})
            tableview.reloadData()
        }
    }
    func fetchData() {
            if let url = URL(string: "https://example.com/api/data.json") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            var movieResponse = try JSONDecoder().decode(movie.self, from: data)
                            self.fetchedMovie = movieResponse.results
                            print(self.fetchedMovie)
                            DispatchQueue.main.async {
                                self.tableview.reloadData()
                            }
                        
                        } catch let error as NSError {
                            print("JSON dönüştürme hatası: \(error.localizedDescription)")
                        }
                    }
                }.resume()
            }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filtreliData.count
        }else {
            return fetchedMovie.count
        }
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                var data: [String:Any]
                if isSearching {
                    data = filtreliData[i]
                } else {
                    data = fetchedMovie[indexPath.row].title.capitalized()              }
                cell.textLabel?.text = data["title"] as? String
                cell.detailTextLabel?.text = data["description"] as? String
                return cell

    }
}
