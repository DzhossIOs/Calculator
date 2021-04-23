//
//  OperationButtons.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/23/21.
//

import UIKit

class OperationButtons: UIButton {
    
    let viewWidth = UIScreen.main.bounds.width * 0.20
    init(title: String , type: ButtonType){
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        backgroundColor = .systemYellow
        tintColor = .black
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .monospacedSystemFont(ofSize: 22, weight: .semibold)
        layer.cornerRadius = viewWidth/2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 0.5
        heightAnchor.constraint(equalToConstant: viewWidth).isActive = true
        widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
