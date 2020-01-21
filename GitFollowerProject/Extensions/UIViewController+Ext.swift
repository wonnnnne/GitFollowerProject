//
//  UIViewController+Ext.swift
//  GitFollowerProject
//
//  Created by HYUNG JOO LEE on 2020/01/03.
//  Copyright © 2020 HYUNG JOO LEE. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, btnTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: btnTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
