//
//  TableViewController.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 12.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var viewModels = [CryptoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CryptoInfoTableViewCell.identifier, for: indexPath)
                as? CryptoInfoTableViewCell else {fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
}
