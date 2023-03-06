//
//  searchViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 4.03.2023.
//

import UIKit

class searchViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        getSearcApi {
            print("asdsd")
        }
        
    }
    
    
    
    func getSearcApi(completed: @escaping () -> ()){
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=d8cc792aeb02fbe6d958a6c58a962a59&query=Fight+Club")
            URLSession.shared.dataTask(with: url!) { data, response, error in
                if error == nil {
                    do {
                        print("do")
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as!  NSArray
                        let result = try Result(from: jsonResponse as! Decoder)
                       print(String(describing: result.originalTitle))
                        
                        DispatchQueue.main.async {
                            
                         print(jsonResponse)
                            
                        }
                    }catch {
                        print("erorrrr")
                    }
                }
            }.resume()
              
        }
}
