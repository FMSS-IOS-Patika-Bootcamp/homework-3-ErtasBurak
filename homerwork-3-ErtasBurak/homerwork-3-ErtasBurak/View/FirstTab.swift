//
//  FirstTab.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import UIKit

class FirstTab: UIViewController {
    
    let tableView = UITableView()
    
    var postsArray = [FirstTabModel]()
    var loading = true
    let postsCount = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in stride(from: 1, to: postsCount + 1 , by: 1){
            fetchData(withID: i)
        }
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstTabCell.self, forCellReuseIdentifier: "firstTabCell")
        view.addSubview(tableView)
        tableViewSetup()
  
    }
    
    func tableViewSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"

    func fetchData(withID id : Int){
        
        guard let url = URL(string: "\(urlString)/\(id)") else{
            fatalError("URL error")
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data{
                guard let posts = try? JSONDecoder().decode(FirstTabModel.self, from: data)
                else{
                    fatalError("Error decoding data")
                }
                self?.postsArray.append(posts)
            }
            self?.loading = false
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.resume()
    }
    
}

extension FirstTab: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loading{
            return 1
        }
        
        return postsArray.count
        
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTabCell", for: indexPath) as! FirstTabCell
        if loading{
            cell.textLabel?.text = ""
        }else{
            let post = postsArray[indexPath.row]
            cell.title.text = post.title
            cell.body.text = post.body
            cell.userId.text = String(post.userId)
            cell.id.text = String(post.id)
        }
  
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
