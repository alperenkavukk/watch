import UIKit
import Alamofire
class searchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  
   a()
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

}
