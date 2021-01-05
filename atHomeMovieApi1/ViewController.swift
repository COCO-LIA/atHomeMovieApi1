//
//  ViewController.swift
//  atHomeMovieApi1
//
//  Created by 황현지 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rexults = [Rexult]()
    
    var originalAddress = "https://api.themoviedb.org/3/movie/popular?api_key=b804ea7f3826d58a902a69a0e017708f&language=en-US&page=1"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }

    func getData() {
        
        let movieUrl = URL(string: originalAddress)
        let request = URLRequest(url: movieUrl!)
        
        //네트워킹
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if err != nil {
                return print("err", err?.localizedDescription)
            } else {
                print(data)
            }
        }.resume()
        
    }
    
    //전체 데이터 파싱
    func parseJsonData(orgData: Data) -> [Rexult] {
        self.rexults = [Rexult]()
        
        let decoder = JSONDecoder()
        do{
          let rexultDataStore = try decoder.decode(RexultDataStore.self, from: orgData)
           rexults = rexultDataStore.rexults
        } catch {
          print(error)
        }
        return rexults
//        
//        do{
//            let jsonResult = try JSONSerialization.jsonObject(with: orgData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
//            
//            //추출
//            let jsonrexults = jsonResult?["rexults"] as! [AnyObject]
//            print(jsonrexults)
//            //반복문
//            for jsonResult in jsonrexults {
//                var rexult = Rexult()
//                
//                rexult.adult = jsonResult[""] as! Bool
//                rexult.popularity = jsonResult["popularity"] as! Int
//                rexult.title = jsonResult["title"] as! String
//                rexult.language = jsonResult["original_title"] as! String
//                
//                rexults.append(rexult)
//            }
//            
//        } catch {
//            print(error)
//        }
        return rexults
    }
}



