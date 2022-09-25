//
//  ToDoTab.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import UIKit
import CoreData

class ToDoTab: UIViewController {

    let tableView = UITableView()
    
    let addButton = UIButton()
    
    var nameArray = [String]()
    
    var idArray = [UUID]()
    
    var imageArray = [UIImage]()
    
    var selectedName = ""
    
    var selectedUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: "todocell")
        view.addSubview(tableView)
        view.addSubview(addButton)
        tableViewSetup()
        addButton_()
        
        getData()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "dataSaved"), object: nil)
    }
    
    @objc func getData(){
        
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String{
                        nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                    
                }
                
                tableView.reloadData()
            }
            
            
        }catch{
            print("error")
        }
    }
    
    func tableViewSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor,constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addButton_(){
        
        addButton.backgroundColor = .darkGray
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: -10).isActive = true
    }
    
    @objc func addTapped(){
        selectedName = ""
        navigationController?.pushViewController(DetailPage(), animated: true)
    }
    
}

extension ToDoTab: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath) as! TodoCell
        cell.name.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = nameArray[indexPath.row]
        selectedUUID = idArray[indexPath.row]
        let VC = DetailPage()
        VC.selectedRow = selectedName
        VC.selectedUUID = selectedUUID
        
        navigationController?.pushViewController(DetailPage(), animated: true)
    }
    
    
    
    

}
