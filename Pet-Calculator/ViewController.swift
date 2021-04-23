//
//  ViewController.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/22/21.
//

import UIKit
import EasyPeasy


class ViewController: UIViewController {
  
    private var firstVar = 0.0
    private var secondVar = 0.0
    private var sum = 0.0
    private var operationType = 0
    let paddingLeft = UIScreen.main.bounds.width * 0.04
    let  paddingInside = UIScreen.main.bounds.width * 0.04
    private var paddingInsideHieght = UIScreen.main.bounds.width * 0.04
    private var str = ""
    let calculator = CalcLabel(title: "Calculator", labelColor: .black)
    let modeButton = ModeButton(img: "sun.max", type: .system)
    let calcView = CalcView()
    let clear = OperationButtons(title: "C", type: .system)
    let mod = OperationButtons(title: "%", type: .system)
    let divide = OperationButtons(title: "/", type: .system)
    let multiply = OperationButtons(title: "*", type: .system)
    let one = OperationButtons(title: "1", type: .system)
    let two = OperationButtons(title: "2", type: .system)
    let three = OperationButtons(title: "3", type: .system)
    let four = OperationButtons(title: "4", type: .system)
    let five = OperationButtons(title: "5", type: .system)
    let six = OperationButtons(title: "6", type: .system)
    let seven = OperationButtons(title: "7", type: .system)
    let eight = OperationButtons(title: "8", type: .system)
    let nine = OperationButtons(title: "9", type: .system)
    let zero = OperationButtons(title: "0", type: .system)
    let plus = PlusButton(title: "+", type: .system)
    let minus = OperationButtons(title: "-", type: .system)
    let equal = OperationButtons(title: "=", type: .system)
    let dot = OperationButtons(title: ".", type: .system)
    let sqrt = OperationButtons(title: "√", type: .system)
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        one.addTarget(self, action: #selector(onePressed), for: .touchUpInside)
        two.addTarget(self, action: #selector(twoPressed), for: .touchUpInside)
        three.addTarget(self, action: #selector(threePressed), for: .touchUpInside)
        four.addTarget(self, action: #selector(fourPressed), for: .touchUpInside)
        five.addTarget(self, action: #selector(fivePressed), for: .touchUpInside)
        six.addTarget(self, action: #selector(sixPressed), for: .touchUpInside)
        seven.addTarget(self, action: #selector(sevenPressed), for: .touchUpInside)
        eight.addTarget(self, action: #selector(eightPressed), for: .touchUpInside)
        nine.addTarget(self, action: #selector(ninePressed), for: .touchUpInside)
        zero.addTarget(self, action: #selector(zeroPressed), for: .touchUpInside)
        dot.addTarget(self, action: #selector(dotPressed), for: .touchUpInside)
        
        clear.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        sqrt.addTarget(self, action: #selector(sqrtPressed), for: .touchUpInside)
        plus.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        minus.addTarget(self, action: #selector(minusPressed), for: .touchUpInside)
        divide.addTarget(self, action: #selector(dividePressed), for: .touchUpInside)
        multiply.addTarget(self, action: #selector(multiplyPressed), for: .touchUpInside)
        equal.addTarget(self, action: #selector(equalPressed), for: .touchUpInside)
        
        setInsidePadding()
        setViews()
        setheriarchy()
        setContraints()
        
        view.backgroundColor = .systemYellow
    }
    func setViews(){}
    func setInsidePadding(){
        print("DEBUG HEIGHT \(UIScreen.main.bounds.height)")
        if UIScreen.main.bounds.height < 800 {
            paddingInsideHieght = 13
        }
    }
    func setheriarchy(){
        view.addSubview(calculator)
        view.addSubview(modeButton)
        view.addSubview(calcView)
        
        view.addSubview(clear)
        view.addSubview(mod)
        view.addSubview(sqrt)
        view.addSubview(multiply)
        
        view.addSubview(seven)
        view.addSubview(eight)
        view.addSubview(nine)
        view.addSubview(divide)
        
        view.addSubview(four)
        view.addSubview(five)
        view.addSubview(six)
        view.addSubview(minus)
        
        view.addSubview(one)
        view.addSubview(two)
        view.addSubview(three)
        view.addSubview(plus)
        
        view.addSubview(zero)
        view.addSubview(dot)
        view.addSubview(equal)
    }
    func setContraints(){
        calculator.easy.layout(CenterX(), Top(50))
        modeButton.easy.layout(Top(50), Right(16))
        calcView.easy.layout(CenterX(), Left(8), Right(8), Top(16).to(calculator))
        
        clear.easy.layout(Top(paddingInsideHieght).to(calcView), Left(paddingLeft))
        mod.easy.layout(Top(paddingInsideHieght).to(calcView), Left(paddingInside).to(clear))
        sqrt.easy.layout(Top(paddingInsideHieght).to(calcView), Left(paddingInside).to(mod))
        multiply.easy.layout(Top(paddingInsideHieght).to(calcView), Left(paddingInside).to(sqrt))
        
        seven.easy.layout(Top(paddingInsideHieght).to(clear), Left(paddingLeft))
        eight.easy.layout(Top(paddingInsideHieght).to(mod), Left(paddingInside).to(seven))
        nine.easy.layout(Top(paddingInsideHieght).to(sqrt), Left(paddingInside).to(eight))
        divide.easy.layout(Top(paddingInsideHieght).to(multiply), Left(paddingInside).to(nine))
        
        four.easy.layout(Top(paddingInsideHieght).to(seven), Left(paddingLeft))
        five.easy.layout(Top(paddingInsideHieght).to(eight), Left(paddingInside).to(four))
        six.easy.layout(Top(paddingInsideHieght).to(nine), Left(paddingInside).to(five))
        minus.easy.layout(Top(paddingInsideHieght).to(divide), Left(paddingInside).to(six))
        
        one.easy.layout(Top(paddingInsideHieght).to(four), Left(paddingLeft))
        two.easy.layout(Top(paddingInsideHieght).to(five), Left(paddingInside).to(one))
        three.easy.layout(Top(paddingInsideHieght).to(six), Left(paddingInside).to(two))
        plus.easy.layout(Top(paddingInsideHieght).to(minus), Left(paddingInside).to(three))
        
        zero.easy.layout(Top(paddingInsideHieght).to(one), Left(paddingLeft))
        dot.easy.layout(Top(paddingInsideHieght).to(two), Left(paddingInside).to(zero))
        equal.easy.layout(Top(paddingInsideHieght).to(three), Left(paddingInside).to(dot))
        
    }
    @objc func onePressed(){
        calcView.workArea.text?.append("1")
    }
    @objc func twoPressed(){
        calcView.workArea.text?.append("2")
    }
    @objc func threePressed(){
        calcView.workArea.text?.append("3")
    }
    @objc func fourPressed(){
        calcView.workArea.text?.append("4")
    }
    @objc func fivePressed(){
        calcView.workArea.text?.append("5")
    }
    @objc func sixPressed(){
        calcView.workArea.text?.append("6")
    }
    @objc func sevenPressed(){
        calcView.workArea.text?.append("7")
    }
    @objc func eightPressed(){
        calcView.workArea.text?.append("8")
    }
    @objc func ninePressed(){
        calcView.workArea.text?.append("9")
    }
    @objc func zeroPressed(){
        calcView.workArea.text?.append("0")
    }
    @objc func dotPressed(){
        calcView.workArea.text?.append(".")
    }
    @objc func clearPressed(){
        calcView.workArea.text? = ""
        calcView.operation.text? = ""
    }
    @objc func sqrtPressed(){
        if calcView.workArea.text != nil {
            let temp = Double(calcView.workArea.text!)
            calcView.workArea.text =  String(format: "%.3f", temp!.squareRoot())
            
        }
        
    }
    
    @objc func plusPressed(){
        if calcView.workArea.text != nil {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " + ")
            
            
            operationType = 1
        }
        
    }
    @objc func minusPressed(){
        if calcView.workArea.text != nil {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " - ")
            operationType = 2
        }
        
    }
    @objc func dividePressed(){
        if calcView.workArea.text != nil {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " / ")
            operationType = 3
        }
        
    }
    @objc func multiplyPressed(){
        if calcView.workArea.text != nil {
            firstVar = Double(calcView.workArea.text!) ?? 0
            calcView.workArea.text = ""
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " * ")
            operationType = 4
        }
        
    }
    @objc func equalPressed(){
        if calcView.workArea.text != nil {
            secondVar = (Double(calcView.workArea.text!) ?? 0)
            isIntager(value: secondVar)
            calcView.operation.text?.append(str + " ")
            
            getSum(command: operationType)
            
            isIntager(value: sum)
            calcView.workArea.text = str
            
        }
        
    }
    func getSum(command: Int){
        switch command  {
        case 1:
            sum = firstVar + secondVar
        case 2:
            sum = firstVar - secondVar
        case 3:
            sum = firstVar / secondVar
        case 4:
            sum = firstVar * secondVar
        default:
            sum = firstVar         }
    }
    
    
    func isIntager(value: Double)  {
        let isInteger = floor(value) == value // true
        var intVar = 0
        if isInteger{
            intVar = Int(value)
            str = String(intVar)
        } else {
        str = String(value)
        }
    }
}

