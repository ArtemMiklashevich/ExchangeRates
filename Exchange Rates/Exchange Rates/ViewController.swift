            //
//  ViewController.swift
//  Exchange Rates
//
//  Created by Artem Miklashevich on 6/7/18.
//  Copyright © 2018 Artem Miklashevych. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    var currList = [Currence]()
    
    @IBOutlet var tableview: UITableView!
    
    func getData() {
        let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil {
                self.currList = try JSONDecoder().decode([Currence].self, from: data!)
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            
                for mainarr in self.currList {
                    print(mainarr.ccy)
                }
                }
                
            } catch {
                print("Error json data")
            }
            
            }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.ccy.text = "\(currList[indexPath.row].ccy) / \(currList[indexPath.row].base_ccy)"
        cell.buy.text = "Buy: \(currList[indexPath.row].buy)"
        cell.sale.text = "Sale: \(currList[indexPath.row].sale)"
        return cell
    }
}

