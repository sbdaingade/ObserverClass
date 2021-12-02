//
//  ViewController.swift
//  ObserableDemo
//
//  Created by Sachin Daingade on 01/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var fruits = Observer(value:["Apple","banana","mango"])
   
    private let table: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        
        fruits.add {[weak self] _ in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
        
        let newFruits = ["Cherry", "sapota","pinaple","orange","papaya"]
        
        for i in 1...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (1 * TimeInterval(i))) {
                self.fruits.value?.append(newFruits.randomElement() ?? "other fruit")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruits.value?[indexPath.row]
        return cell
    }
}

