//
//  CurrencyTableViewController.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import UIKit


class CurrencyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
        
        return tableView
    } ()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.allowsFloats = true
        formatter.formatterBehavior = .default
        return formatter
    } ()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView.self)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NetworkManager.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    let price = model.price_usd ?? 0
                    let formatter = CurrencyTableViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let iconURL = URL(
                        string:
                            NetworkManager.shared.icons.filter({ icon in
                                icon.asset_id == model.asset_id
                            }).first?.url ?? ""
                    )
                    
                    return CryptoTableViewCellViewModel(
                        name: model.name ?? "N/A",
                        symbol: model.asset_id,
                        price: priceString ?? "",
                        iconURL: iconURL
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error): print("Error: \(error)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    // MARK: - Navigation

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CurrencyTableViewCell.identifier, for: indexPath)
                as? CurrencyTableViewCell else {fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }

}

