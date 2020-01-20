//
//  FollowerListVC.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2020/01/02.
//  Copyright © 2020 HYUNG JOO LEE. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
