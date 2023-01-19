//
//  UIView+Extension.swift
//  APINasaVIPERTestApp
//
//  Created by Юрий Альт on 20.01.2023.
//

import UIKit.UIView

extension UIView {
    func addAutolayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addAutolayoutSubviews(_ views: UIView...) {
        views.forEach { addAutolayoutSubview($0) }
    }
}
