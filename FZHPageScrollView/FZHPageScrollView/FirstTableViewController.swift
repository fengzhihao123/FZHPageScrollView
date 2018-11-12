//
//  FirstTableViewController.swift
//  FZHPageScrollView
//
//  Created by 冯志浩 on 2018/11/6.
//  Copyright © 2018 冯志浩. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.green
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
