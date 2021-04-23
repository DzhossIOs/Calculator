//
//  CalcLabel.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/22/21.
//

import UIKit


class CalcLabel: UILabel {
    
    init(title: String, labelColor: UIColor){
        super.init(frame: .zero)
        text = title
        textColor = labelColor
        textAlignment = .center
        font = .monospacedSystemFont(ofSize: 24, weight: .semibold)
       // font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
