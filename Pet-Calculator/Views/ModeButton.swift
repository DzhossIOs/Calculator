//
//  ModeButton.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/23/21.
//

import UIKit

class ModeButton: UIButton {

    init(img: String , type: ButtonType){
        super.init(frame: .zero)
        let image = img
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
         let largeBoldDoc = UIImage(systemName: image, withConfiguration: largeConfig)
        setImage(largeBoldDoc, for: .normal)
        backgroundColor = .none
        tintColor = .black
        titleLabel?.font = .monospacedSystemFont(ofSize: 22, weight: .semibold)
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 0.5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
