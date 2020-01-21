//
//  SearchVC.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2019/12/30.
//  Copyright © 2019 HYUNG JOO LEE. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let logoImgView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionBtn = GFbutton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool{ return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImgView()
        configureTextField()
        configureCallToActionBtn()
        dismissKeyboardTouchGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func dismissKeyboardTouchGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please Enter the username that you are looking for 😀", btnTitle: "Ok")
//            let alertvc = GFAlertVC(title: "Empty Username", message: "Please Enter the username that you are looking for 😀", buttonTitle: "Ok")
//            present(alertvc, animated: true)
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
        
    }
    
    func configureLogoImgView() {
        view.addSubview(logoImgView)
        logoImgView.translatesAutoresizingMaskIntoConstraints = false
        logoImgView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImgView.heightAnchor.constraint(equalToConstant: 200),
            logoImgView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionBtn() {
        view.addSubview(callToActionBtn)
        callToActionBtn.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        textField.resignFirstResponder()
        return true
    }
    
}
