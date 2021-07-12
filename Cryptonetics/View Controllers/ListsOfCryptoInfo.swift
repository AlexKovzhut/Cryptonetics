//
//  ListsOfCryptoInfo.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 12.07.2021.
//

import UIKit

class ListsOfCryptoInfo: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoInfoTableViewCell.self, forCellReuseIdentifier: CryptoInfoTableViewCell.identifier)
        
        return tableView
    } ()
    
    private var viewModels = [CryptoModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.allowsFloats = true
        formatter.formatterBehavior = .default
        return formatter
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cryptonetics"
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NetworkManager.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    //NumberFormatter
                    let price = model.price_usd ?? 0
                    let formatter = ListsOfCryptoInfo.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let iconURL = URL(
                        string:
                            NetworkManager.shared.icons.filter({ icon in
                                icon.asset_id == model.asset_id
                            }).first?.url ?? ""
                    )
                    
                    return CryptoModel(
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
    
    //MARK: - TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CryptoInfoTableViewCell.identifier, for: indexPath)
                as? CryptoInfoTableViewCell else {fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }


}
