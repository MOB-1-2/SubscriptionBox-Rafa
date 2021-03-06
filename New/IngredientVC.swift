//
//  NewVC.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/24/21.
//
import Foundation
import UIKit

class IngredientVC: UIViewController {
    
    let data = [
        Ingredient(title: "Lettuce", image: UIImage(named: "lettuce")!),
        Ingredient(title: "Tomato", image: UIImage(named: "tomato")!),
        Ingredient(title: "Pickle", image: UIImage(named: "pickle")!),
        Ingredient(title: "Onion", image: UIImage(named: "onion")!),
        Ingredient(title: "Jalapeno", image: UIImage(named: "jalapeno")!),
        Ingredient(title: "Cheese", image: UIImage(named: "cheese")!),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.title = "New"

        collectionView.dataSource = self
        collectionView.delegate = self
        
        setViews()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(IngredientCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    
    func setViews(){
        
        self.view.addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
}

extension IngredientVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IngredientCell
        cell.backgroundColor = #colorLiteral(red: 0.682464242, green: 0.7204806209, blue: 0.7296580672, alpha: 1)
        cell.data = self.data[indexPath.row]
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/3)
    }
    
}
