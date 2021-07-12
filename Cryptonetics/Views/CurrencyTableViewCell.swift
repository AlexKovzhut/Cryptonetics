//
//  CoinTableViewCell.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import UIKit

class CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let iconURL: URL?
    var iconData: Data?
    
    init(name: String, symbol: String, price: String, iconURL: URL?) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconURL = iconURL
    }
}

class CurrencyTableViewCell: UITableViewCell {
    
    
    
    static let identifier = "CurrencyCell"
    
    private let namelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        
        return label
    } ()
    
    //MARK: - Subviews
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        return label
    } ()
    
    private let pricelabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return label
    } ()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    } ()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(namelabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(pricelabel)
        contentView.addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Layouts
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        iconImageView.frame = CGRect(
            x: 20,
            y: (contentView.frame.size.height-size)/2,
            width: size,
            height: size
        )
        
        
        namelabel.sizeToFit()
        symbolLabel.sizeToFit()
        pricelabel.sizeToFit()
        
        namelabel.frame = CGRect(
            x: 30 + size,
            y: 0,
            width: contentView.frame.size.width/2,
            height: contentView.frame.size.height/2
        )
        
        symbolLabel.frame = CGRect(
            x: 30 + size,
            y: contentView.frame.size.height/2,
            width: contentView.frame.size.width/2,
            height: contentView.frame.size.height/2
        )
        
        pricelabel.frame = CGRect(
            x: contentView.frame.size.width/2,
            y: 0,
            width: (contentView.frame.size.width/2)-15,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        namelabel.text = nil
        symbolLabel.text = nil
        pricelabel.text = nil
    }
    
    // MARK: - Configure
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        namelabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        pricelabel.text = viewModel.price
        
        if let data = viewModel.iconData {
            iconImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.iconURL {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                if let data = data {
                    viewModel.iconData = data
                    DispatchQueue.main.async {
                        self?.iconImageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
}
