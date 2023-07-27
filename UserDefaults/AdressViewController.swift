//
//  adressViewController.swift
//  UserDefaults
//
//  Created by User on 25.06.2023.
//

import UIKit

class AdressViewController: UIViewController {
    
    let myTable = UITableView()
    
    //let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    //let buttonNavBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openViewController))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Добавь адрес"
        
        AddScren()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myTable.reloadData()
    }
    
    func AddScren() {
        
        let buttonNavBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openViewController))
        
        view.addSubview(myTable)
        navigationItem.rightBarButtonItem = buttonNavBar
        
        myTable.dataSource = self
        myTable.delegate = self
        
        view.backgroundColor = .white
        
        myTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    @objc func openViewController() {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)        
    }
    
}

extension AdressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.addres.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
//        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
//            cell = dCell
//        }else {
//            cell = UITableViewCell()
//        }
        cell.textLabel!.text = Base.shared.addres[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Base.shared.addres.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
