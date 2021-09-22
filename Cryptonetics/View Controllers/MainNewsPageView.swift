//
//  MainNewsPageView.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 13.07.2021.
//

import UIKit

class MainNewsPageView: UIViewController {
    
    private var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        load()
        collectionView.frame = view.frame
    }
    
    override func viewDidLayoutSubviews() {
        self.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.frame
    }
    
    func load() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionViewLayout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

extension MainNewsPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = .brown
        
        return cell
    }
}

extension MainNewsPageView: UICollectionViewDelegate {
    
}
