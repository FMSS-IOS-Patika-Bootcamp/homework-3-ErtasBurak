//
//  ViewController.swift
//  homerwork-3-ErtasBurak
//
//  Created by Burak Ertaş on 23.09.2022.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupTabBars()
        
    }
    
    func setupTabBars(){
        // Create Tab one
        let tabOne = FirstTab()
        let tabOneBarItem = UITabBarItem(title: "First Tab", image: nil, selectedImage: nil)
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = SecondTap()
        let tabTwoBarItem2 = UITabBarItem(title: "Second Tab", image: nil, selectedImage: nil)
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab ToDo
        let toDo = ToDoTab()
        let tabTodoBarItem = UITabBarItem(title: "ToDo Tab", image: nil, selectedImage: nil)
        
        toDo.tabBarItem = tabTodoBarItem
        
        
        self.viewControllers = [tabOne, tabTwo, toDo]
        
        self.tabBar.backgroundColor = .white //default color is black and we can not see the second tab because it has gray color
    }
    
}

