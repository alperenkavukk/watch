//
//  movieInfoViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 7.03.2023.
//

import UIKit

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
        
        infoTextView.text = film?.overview
        
       
        print("query")
       
        let imgUrl = "https://api.themoviedb.org/3/movie/\(film?.id)?api_key=d8cc792aeb02fbe6d958a6c58a962a59&language=en-US&append_to_response=\(film?.posterPath)"
        imageView.downloaded(from: imgUrl)
    }
    

   
    

}
