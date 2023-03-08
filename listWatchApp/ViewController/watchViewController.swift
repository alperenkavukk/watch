//
//  watchViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 8.03.2023.
//

import UIKit
import Firebase
import FirebaseFirestore

class watchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    var movieDownload = movieBilgiViewController()
    
    @IBOutlet weak var tableView: UITableView!
    var movieTitleArray = [String]()
    var moviePosterArray = [String]()
    var userEmailArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        getDataFromFirestore()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movieTitleArray[indexPath.row]
        cell.imageView?.downloaded(from: moviePosterArray[indexPath.row])
        return cell
    }
    
    
    
    
    func getDataFromFirestore(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Watch").addSnapshotListener { snapshot, error in
        if error != nil
            {
            print("error")
        }
            else
            {
                if snapshot?.isEmpty != true && snapshot != nil
                {
                    for document in  snapshot!.documents {
                        let documanID = document.documentID
                        if let movieTitle = document.get("movieTitle") as? String {
                            self.movieTitleArray.append(movieTitle)
                        }
                        if let imgUrl = document.get("imgUrl") as? String {
                            self.moviePosterArray.append(imgUrl)
                        }
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                }
                    self.tableView.reloadData()
            }
        }
        
    }

}
}
