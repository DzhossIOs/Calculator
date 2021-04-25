//
//  CalcLabel.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/22/21.
//

import UIKit


class CalcLabel: UILabel {
    
    init(title: String, modeStyle: Bool){
        super.init(frame: .zero)
        text = title
        
        textAlignment = .center
        font = .monospacedSystemFont(ofSize: 24, weight: .semibold)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        if modeStyle {
            textColor = .black
        }
        else {
            textColor = .cyan
        }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
