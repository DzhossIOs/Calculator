//
//  ViewController.swift
//  Pet-Calculator
//
//  Created by Zhastalap Aldanysh on 4/22/21.
//
import EasyPeasy
import UIKit

class ViewController: UIViewController {
    var mode = true
    private var checkOperation = false
    private var dotCounter = false
    private var firstVar = 0.0
    private var secondVar = 0.0
    private var sum = 0.0
    private var operationType = 0
    private var calculated = false
    private let paddingLeft = UIScreen.main.bounds.width * 0.04
    private let paddingInside = UIScreen.main.bounds.width * 0.04
    private var paddingInsideHieght = UIScreen.main.bounds.width * 0.04
    private var paddingMain = CGFloat(50)
    private var str = ""

    let calculator = CalcLabel(title: "Calculator", modeStyle: true)
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

        modeButton.addTarget(self, action: #selector(modeChanged), for: .touchUpInside)

        setInsidePadding()
        setheriarchy()
        setContraints()

        view.backgroundColor = .systemYellow
    }
    
    func setInsidePadding() {
        print("DEBUG HEIGHT \(UIScreen.main.bounds.height)")
        if UIScreen.main.bounds.height < 800 {
            paddingInsideHieght = 13
        }
        if UIScreen.main.bounds.height < 740 {
            paddingInsideHieght = 12
            paddingMain = 40
        }
        if UIScreen.main.bounds.height < 700 {
            paddingInsideHieght = 12
            paddingMain = 30
        }
        
    }

    func setheriarchy() {
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

    func setContraints() {
        calculator.easy.layout(CenterX(), Top(paddingMain))
        modeButton.easy.layout(Top(paddingMain), Right(16))
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

    @objc func onePressed() {
        checkForOperation()
        checkStringLength(value: "1")
    }

    @objc func twoPressed() {
        checkForOperation()
        checkStringLength(value: "2")
    }

    @objc func threePressed() {
        checkForOperation()
        checkStringLength(value: "3")
    }

    @objc func fourPressed() {
        checkForOperation()
        checkStringLength(value: "4")
    }

    @objc func fivePressed() {
        checkForOperation()
        checkStringLength(value: "5")
    }

    @objc func sixPressed() {
        checkForOperation()
        checkStringLength(value: "6")
    }

    @objc func sevenPressed() {
        checkForOperation()
        checkStringLength(value: "7")
    }

    @objc func eightPressed() {
        checkForOperation()
        checkStringLength(value: "8")
    }

    @objc func ninePressed() {
        checkForOperation()
        checkStringLength(value: "9")
    }

    @objc func zeroPressed() {
        checkForOperation()
        checkStringLength(value: "0")
    }

    @objc func dotPressed() {
        checkForOperation()
        checkForDot()
    }

    @objc func clearPressed() {
        calcView.workArea.text? = ""
        calcView.operation.text? = ""
        dotCounter = false
    }

    @objc func sqrtPressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            if let unwrap = calcView.workArea.text {
                let temp = Double(unwrap)
                let sqrt = temp?.squareRoot()
                isIntager(value: sqrt!)
                calcView.workArea.text = str
                dotCounter = false
            }
        }
    }

    @objc func plusPressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " + ")
            operationType = 1
            dotCounter = false
        }
    }

    @objc func minusPressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " - ")
            operationType = 2
            dotCounter = false
        }
    }

    @objc func dividePressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            firstVar = Double(calcView.workArea.text!) ?? 0
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " / ")
            operationType = 3
            dotCounter = false
        }
    }

    @objc func multiplyPressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            firstVar = Double(calcView.workArea.text!) ?? 0
            calcView.workArea.text = ""
            isIntager(value: firstVar)
            calcView.workArea.text = ""
            calcView.operation.text?.append(str + " * ")
            operationType = 4
            dotCounter = false
        }
    }

    @objc func equalPressed() {
        if calcView.workArea.text != nil, calcView.workArea.text != "" {
            secondVar = (Double(calcView.workArea.text!) ?? 0)
            isIntager(value: secondVar)
            calcView.operation.text?.append(str + " = ")
            getSum(command: operationType)
            isIntager(value: sum)
            if str.count > 10 {
                str = "I can't"
            }
            calcView.workArea.text = str
            calculated = true
            checkOperation = true
            dotCounter = false
        }
    }

    func getSum(command: Int) {
        switch command {
        case 1:
            sum = firstVar + secondVar
        case 2:
            sum = firstVar - secondVar
        case 3:
            sum = firstVar / secondVar
        case 4:
            sum = firstVar * secondVar
        default:
            sum = firstVar
        }
    }

    func isIntager(value: Double) {
        let isInteger = floor(value) == value // true
        str = String(value)
        var intVar = 0
        if isInteger {
            intVar = Int(value)
            str = String(intVar)
        } else {
            str = String(format: "%g", value)
        }
    }

    func isCalculated() {
        if calculated {
            calcView.workArea.text = ""
            calcView.operation.text = ""
        }
    }

    @objc func modeChanged() {
        mode.toggle()
        if mode {
            modeButton.setImage(UIImage(systemName: "moon"), for: .normal)
        } else {
            modeButton.setImage(UIImage(systemName: "sun.max"), for: .normal)
        }
    }

    func checkStringLength(value: String) {
        if calcView.workArea.text?.count ?? 0 <= 8 {
            calcView.workArea.text?.append(value)
        } else {
            let alert = UIAlertController(title: "Stop Clicking", message: "This is not professional calculator", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "GOT IT", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    func checkForOperation() {
        if checkOperation {
            calcView.workArea.text = ""
            calcView.operation.text = ""
            checkOperation = false
        }
    }

    func checkForDot() {
        if dotCounter == false {
            if calcView.workArea.text == ""{
                checkStringLength(value: "0.")
                dotCounter = true
            } else {
                checkStringLength(value: "0.")
                dotCounter = true
            }
        } else {
            let alert = UIAlertController(title: "Stop Clicking Dot", message: "One Dot is enough", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "GOT IT", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
