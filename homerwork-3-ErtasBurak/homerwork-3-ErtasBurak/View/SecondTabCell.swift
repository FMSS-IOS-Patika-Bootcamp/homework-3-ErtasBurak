//
//  SecondTabCell.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 24.09.2022.
//

import UIKit

class SecondTabCell: UICollectionViewCell {
    
    let id = UILabel()
 
    let albumId = UILabel()
 
    let title = UILabel()
    
    let url = UIImageView()
    
    let thumbURL = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        
    }
    
    override func awakeFromNib() {
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        //title config
        
        title.textColor =  .black
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        
        //userId config
        
        albumId.textColor =  .black
        albumId.translatesAutoresizingMaskIntoConstraints = false
        
        //id config
        
        id.textColor =  .black
        id.translatesAutoresizingMaskIntoConstraints = false
        
        //url config

        url.translatesAutoresizingMaskIntoConstraints = false

        //thumbnailUrl config
        
        thumbURL.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setupConstraints(){
        
        contentView.addSubview(id)
        id.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        id.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:20).isActive = true
        id.widthAnchor.constraint(equalToConstant:30).isActive = true
        id.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        title.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        contentView.addSubview(url)
        url.widthAnchor.constraint(equalToConstant: 150).isActive = true
        url.heightAnchor.constraint(equalToConstant: 150).isActive = true
        url.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        url.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -20).isActive = true
        
        contentView.addSubview(albumId)
        albumId.widthAnchor.constraint(equalToConstant:26).isActive = true
        albumId.heightAnchor.constraint(equalToConstant:26).isActive = true
        albumId.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant:-20).isActive = true
        albumId.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(thumbURL)
        thumbURL.topAnchor.constraint(equalTo: self.url.bottomAnchor,constant: 20).isActive = true
        thumbURL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        thumbURL.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thumbURL.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
    }
    
}
