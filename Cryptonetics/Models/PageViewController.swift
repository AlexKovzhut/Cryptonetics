//
//  PageViewController.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 10.07.2021.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Image
    
    private let newsHeadingImage: UIImageView = {
        let view = UIImageView()
        
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    //MARK: - Label
    
    private let newsHeadingLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    lazy var subView: [UIView] = [self.newsHeadingImage, self.newsHeadingLabel]
    
    //MARK: - Init

    init(newsWith: NewsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.purple
        edgesForExtendedLayout = []
        
        newsHeadingImage.image = newsWith.headingImage
        newsHeadingLabel.text = newsWith.headingLabel
        
        for view in subView {self.view.addSubview(view)}
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: newsHeadingImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: newsHeadingImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: newsHeadingImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: newsHeadingImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: newsHeadingLabel, attribute: .top, relatedBy: .equal, toItem: newsHeadingImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: newsHeadingLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .notAnAttribute, multiplier: 1, constant: 250),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
