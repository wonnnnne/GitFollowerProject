//
//  GFbutton.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2019/12/31.
//  Copyright © 2019 HYUNG JOO LEE. All rights reserved.
//

import UIKit

class GFbutton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
