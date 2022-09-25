//
//  TodoCell.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 25.09.2022.
//

import UIKit

class TodoCell: UITableViewCell {
    
    let name = UILabel()
 
    let photo = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(name)
        self.contentView.addSubview(photo)
        
        setupUI()
        setupConstraints()
    
    }
    
    func setupConstraints(){
        name.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        name.widthAnchor.constraint(equalToConstant:70).isActive = true
        name.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        photo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 200).isActive = true
        photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  
    }
    
    func setupUI(){

        //name config
        
        name.textColor =  .black
        name.translatesAutoresizingMaskIntoConstraints = false
        
        //photo config
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
