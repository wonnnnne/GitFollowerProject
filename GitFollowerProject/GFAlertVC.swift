//
//  GFAlertVC.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2020/01/03.
//  Copyright © 2020 HYUNG JOO LEE. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionBtn = GFbutton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var btnTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.btnTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionBtn()
        configureMessageLabel()
    }
    
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
    
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    func configureActionBtn() {
        containerView.addSubview(actionBtn)
        actionBtn.setTitle(btnTitle ?? "Ok", for: .normal)
        actionBtn.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func dissmissVC() {
        dismiss(animated: true)
    }
    
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionBtn.topAnchor, constant: -12)
        ])
    }

}
