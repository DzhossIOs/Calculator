//
//  plusButton.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/23/21.
//

import UIKit

class PlusButton: UIButton {
    let viewWidth = UIScreen.main.bounds.width * 0.20
    let heightBtn = UIScreen.main.bounds.width * 0.40 + 16

    init(title: String, type _: ButtonType) {
        super.init(frame: .zero)
        print("DEBUG   height  =   \(heightBtn)")
        setTitle(title, for: .normal)
        backgroundColor = .systemYellow
        tintColor = .black
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .monospacedSystemFont(ofSize: 22, weight: .semibold)
        layer.cornerRadius = viewWidth / 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 0.5
        heightAnchor.constraint(equalToConstant: heightBtn).isActive = true
        widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
