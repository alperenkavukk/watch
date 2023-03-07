//
//  aramaViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 7.03.2023.
//

import UIKit
import Alamofire
class aramaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var data = [Result]()
    var filteredData = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        searchBar.placeholder = "Ara..."
        navigationItem.titleView = searchBar
        
       
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredData = data
        } else {
            let searchTerm = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let apiUrl = "https://api.themoviedb.org/3/search/movie?api_key=d8cc792aeb02fbe6d958a6c58a962a59&query=\(searchTerm)"
            guard let url = URL(string: apiUrl) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) {[self] data, response, error in
                guard let data = data else {
                    return
                }
                guard let decodeData = try? JSONDecoder().decode(movie.self, from: data) else {
                    return
                }
                self.filteredData = decodeData.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            task.resume()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = filteredData[indexPath.row].originalTitle.capitalized
        cell.textLabel?.text = item
        print(item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMovieVc", sender: self)
    }
    override func prepare(for seque: UIStoryboardSegue, sender: Any? ){
        if let destination = seque.destination as? movieInfoViewController{
            destination.film = filteredData[tableView.indexPathForSelectedRow!.row]
            
        }
    }
}
