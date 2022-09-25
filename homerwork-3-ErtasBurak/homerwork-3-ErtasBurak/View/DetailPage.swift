//
//  DetailPage.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 25.09.2022.
//

import UIKit
import CoreData

class DetailPage: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let nameLabel = UITextField()
    
    let photo = UIImageView()
    
    let button = UIButton()
    
    var selectedRow = ""
    var selectedUUID : UUID?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedRow != "" {
            if let uuidString = selectedUUID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do{
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0{
                        for result in results as! [NSManagedObject]{
                            
                            if let name = result.value(forKey: "name") as? String{
                                nameLabel.text = name
                            }
                            
                            if let photoData = result.value(forKey: "photo") as? Data{
                                let image = UIImage(data: photoData)
                                photo.image = image
                            }
                            
                        }
                    }
                }catch{
                    print("error")
                }
            }
        }else{
            nameLabel.text = ""
        }
        
        view.backgroundColor = .white

        setupUI()
        
        setupConstraints()
        
        saveAndReturn()
    }
    

    func setupUI(){
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.cornerRadius = 5
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.borderWidth = 4
        photo.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoSelect))
        photo.addGestureRecognizer(imageGestureRecognizer)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(saveAndReturn), for: .touchUpInside)
        
    }
    
    func setupConstraints(){
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,constant: 30).isActive = true
        
        view.addSubview(photo)
        photo.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 30).isActive = true
        photo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        photo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        photo.bottomAnchor.constraint(equalTo: photo.topAnchor,constant: 200).isActive = true
        
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: photo.bottomAnchor,constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: button.topAnchor,constant: 30).isActive = true
        
        
    }
    
    @objc func saveAndReturn(){
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        
        toDo.setValue(nameLabel.text!, forKey: "name")
        toDo.setValue(UUID(), forKey: "id")
        
        let data = photo.image?.jpegData(compressionQuality: 0.5)
        
        toDo.setValue(data, forKey: "photo")
        
        do{
            try context.save()
            print("saved")
        }catch{
            print("Error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dataSaved"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @objc func photoSelect(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        photo.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
    }

}
