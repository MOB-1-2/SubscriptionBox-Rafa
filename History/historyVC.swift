//
//  historyVC.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/24/21.
//

import UIKit

class historyVC: UIViewController {
    
    let tableView =  UITableView()
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableView()
    }

    func setUpTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func getItems(){
        let item1 = Ingredient(title: "Lettuce", image: UIImage(named: "lettuce")!)
        let item2 = Ingredient(title: "Tomato", image: UIImage(named: "tomato")!)
        let item3 = Ingredient(title: "Onion", image: UIImage(named: "onion")!)
        let item4 = Ingredient(title: "Pickle", image: UIImage(named: "pickle")!)
        let item5 = Ingredient(title: "Jalapeno", image: UIImage(named: "jalapeno")!)
        let item6 = Ingredient(title: "Cheese", image: UIImage(named: "cheese")!)

        let ordersList = [Order(title: "Order #1", image: UIImage(named: "burger")!, items: [item1, item2, item6]),
                        Order(title: "Order #2", image: UIImage(named: "burger")!, items: [item6, item6, item6]),
                        Order(title: "Order #3", image: UIImage(named: "burger")!, items: [item5, item1, item2, item3, item4, item6]),
                        Order(title: "Order #4", image: UIImage(named: "burger")!, items: [item6, item3, item5])
        ]

        for box in ordersList {
            orders.append(box)
        }
    }

}

extension historyVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCell
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.setBoxContents(box: orders[indexPath.row])
            cell.textLabel?.text = "\(indexPath.row + 1) \(orders[indexPath.row].title)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected!")
        let nextVC: OrderList = OrderList()
        nextVC.currentOrder = orders[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
