//
//  SecondTab.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import UIKit
import Kingfisher

class SecondTap: UIViewController {
    
    var collectionView:UICollectionView!
    
    var postsArray = [SecondTabModel]()
    var loading = true
    let postsCount = 4999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in stride(from: 1, to: postsCount + 1 , by: 1){
            fetchData(withID: i)
        }
        
        view.backgroundColor = .white
        
        setupUI()
        
    }
    
    func setupUI(){
        
        createCollectionView()
        
    }
    
    func createCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 400, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInsetReference = .fromSafeArea
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SecondTabCell.self, forCellWithReuseIdentifier: "secondTabCell")
        
    }
    
    let urlString = "https://jsonplaceholder.typicode.com/photos"

    func fetchData(withID id : Int){
        
        guard let url = URL(string: "\(urlString)/\(id)") else{
            fatalError("URL error")
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data{
                guard let posts = try? JSONDecoder().decode(SecondTabModel.self, from: data)
                else{
                    fatalError("Error decoding data")
                }
                self?.postsArray.append(posts)
            }
            self?.loading = false
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }.resume()
    }
    
}


extension SecondTap: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondTabCell", for: indexPath) as! SecondTabCell
        cell.layer.borderWidth = 4
        cell.layer.cornerRadius = 20
        if loading {
            cell.albumId.text = ""
        }else{
            let post = postsArray[indexPath.row]
            cell.title.text = post.title
            let url = URL(string: post.url)
            cell.url.kf.setImage(with: url)
            cell.albumId.text = String(post.albumId)
            cell.id.text = String(post.id)
            let url2 = URL(string: post.thumbnailUrl)
            cell.thumbURL.kf.setImage(with: url2)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if loading{
            return 1
        }
        
        return postsArray.count
        
        }
 
}
    
    

