//
//  FirstTabCell.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import UIKit

class FirstTabCell: UITableViewCell {
    
    let body = UILabel()
    
    let id = UILabel()
 
    let userId = UILabel()
 
    let title = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(id)
        self.contentView.addSubview(title)
        self.contentView.addSubview(userId)
        self.contentView.addSubview(body)
        
        setupUI()
        setupConstraints()
    
    }
    
    func setupConstraints(){
        id.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        id.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        id.widthAnchor.constraint(equalToConstant:70).isActive = true
        id.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        title.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        title.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        body.widthAnchor.constraint(equalToConstant: 300).isActive = true
        body.heightAnchor.constraint(equalToConstant: 100).isActive = true
        body.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        body.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        userId.widthAnchor.constraint(equalToConstant:26).isActive = true
        userId.heightAnchor.constraint(equalToConstant:26).isActive = true
        userId.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        userId.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
    
    func setupUI(){
        
        //title config
        
        title.textColor =  .black
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        
        //userId config
        
        userId.textColor =  .black
        userId.translatesAutoresizingMaskIntoConstraints = false
        
        //id config
        
        id.textColor =  .black
        id.translatesAutoresizingMaskIntoConstraints = false
        
        //body config
        
        body.textColor = .black
        body.translatesAutoresizingMaskIntoConstraints = false
        body.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
