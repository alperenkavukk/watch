//
//  movieInfoViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 7.03.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class movieInfoViewController: UIViewController {

    
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var film:Result?
    var api = aramaViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        configureItems()
        movioInfo()

        
    }
    
    private func configureItems(){
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle"), style: UIBarButtonItem.Style.done, target: self, action: #selectorsaveWatchData()),
            UIBarButtonItem(image: UIImage(systemName: "heart"), style: UIBarButtonItem.Style.done, target: self, action: #selector(saveLikeData))

        ]
    }
    
   
    @objc func saveWatchData(){
        let imgurl = "https://image.tmdb.org/t/p/w500/"+((film?.posterPath)!)
        let url = URL(string: imgurl)
        imageView.downloaded(from: url! )
        let db = Firestore.firestore()
        var firestoreReference :DocumentReference? = nil
        let user = ["imgUrl":  imgurl,"postedBy": Auth.auth().currentUser!.email!, "movieTitle": film!.originalTitle] as [String: Any]
        firestoreReference = db.collection("Watch").addDocument(data: user, completion: { error in
            if error != nil {
                
            }else
            {
                print("sucsses")
            }
        })
    }
    
    @objc func saveLikeData(){
        let imgurl = "https://image.tmdb.org/t/p/w500/"+((film?.posterPath)!)
        let url = URL(string: imgurl)
        imageView.downloaded(from: url! )
        let db = Firestore.firestore()
        var firestoreReference :DocumentReference? = nil
        let user = ["imgUrl":  imgurl,"postedBy": Auth.auth().currentUser!.email!, "movieTitle": film!.originalTitle] as [String: Any]
        firestoreReference = db.collection("Like").addDocument(data: user, completion: { error in
            if error != nil {
                
            }else
            {
                print("sucsses")
            }
        })
    }
    
    
    
    
    func movioInfo(){
        infoTextView.text = film?.overview
        title = film?.originalTitle
        let imgurlString = "https://image.tmdb.org/t/p/w500/"+((film?.posterPath)!)
        let url = URL(string: imgurlString)
        imageView.downloaded(from: url! )
    }
    
    

}
