//
//  CalcView.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/23/21.
//

import EasyPeasy
import UIKit

class CalcView: UIView {
    let operation = CalcLabel(title: "", modeStyle: true)
    let workArea = CalcLabel(title: "", modeStyle: true)
    private var viewHeight = UIScreen.main.bounds.height * 0.245

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSizeOfCalcView()
        heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        print("DEBUG HEIGHT OF CALC VIEW \(viewHeight)")
        setViews()
        setHeriarchy()
        setContraints()
    }

    func setViews() {
        operation.font = .monospacedSystemFont(ofSize: 18, weight: .light)
        workArea.font = .monospacedSystemFont(ofSize: 60, weight: .ultraLight)
    }

    func setHeriarchy() {
        addSubview(workArea)
        addSubview(operation)
    }

    func setContraints() {
        workArea.easy.layout(Right(16), Bottom(20))
        operation.easy.layout(Right(16), Bottom(10).to(workArea))
    }

    func setSizeOfCalcView() {
        if UIScreen.main.bounds.height < 800 {
            viewHeight = UIScreen.main.bounds.height * 0.18
        }
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
