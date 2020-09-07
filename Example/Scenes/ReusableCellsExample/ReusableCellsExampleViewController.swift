//
//  ReusableCellsExampleViewController.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class ReusableCellsExampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReusableCellsExampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        if index == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, with: ExampleCell1.self)
            cell.myLabel.text = "ExampleCell1"
            return cell
        } else {
            return tableView.dequeueReusableCell(for: indexPath, with: ExampleCell2.self) { (cell) in
                cell.myLabel.text = "ExampleCell2"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return tableView.dequeueReusableHeaderFooterView(for: ExampleClassHeaderView.self, configure: {
//            $0.update(with: "My text")
//        })
        
//        return tableView.dequeueReusableHeaderFooterView(for: ExampleStoryboardHeaderView.self)
        return tableView.dequeueReusableHeaderFooterView(for: ExampleHeaderView.self)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 620
    }
}
