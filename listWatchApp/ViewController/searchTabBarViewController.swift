//
//  searchTabBarViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 4.03.2023.
//

import UIKit

class searchTabBarViewController: UIViewController {
    
    var fetchedMovie = [search]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func getApi(){
        fetchedMovie = []
        let url = "https://api.themoviedb.org/3/search/movie?api_key=d8cc792aeb02fbe6d958a6c58a962a59&query=Fight+Club"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error")
            }
            else
            {
                do
                {
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    for eachFetchedMovie in fetchedData {
                        let eachMovie = eachFetchedMovie as! [String:Any]
                        let title = eachMovie["original_title"] as! String
                        let info = eachMovie["overview"] as! String
                        
                        self.fetchedMovie.append(search(original_title: title, overview: info))
                }
                    print(self.fetchedMovie)
                }
                catch
                {
                    print("error")
                }
            }
        }
        task.resume()
        
    }

}
class search {
    var original_title : String
    var overview : String
    
    
    init( original_title : String, overview : String){
        self.original_title = original_title
        self.overview = overview
       
             }
}
