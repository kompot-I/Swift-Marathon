//
//  ViewController.swift
//  Tipsy
//
//  Created by Nikita Zubov on 21.02.2023.
//

import UIKit

var calculator = Calculator()

class CalculatorViewController: UIViewController {
    
    //MARK: Private Properties
    
    private var billLabel: UILabel = {
        let labelView = UILabel()
        
        labelView.text = "Enter bill total"
        labelView.font = .systemFont(ofSize: 25)
        labelView.textColor = .lightGray
        labelView.textAlignment = .justified
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelView
    }()
    
    lazy private var billTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .lightGray
        textField.text = "1.11"
        textField.font = .systemFont(ofSize: 35)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        
        return textField
    }()
    
    private var bottomView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.09, green: 0.07, blue: 0.17, alpha: 1.0)
        
        return view
    }()
    
    private var selectTipLabel: UILabel = {
       let labelView = UILabel()
        labelView.text = "Select tip"
        labelView.textColor = .lightGray
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .systemFont(ofSize: 25)
        
        return labelView
    }()
    
    lazy private var zeroButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.09, green: 0.07, blue: 0.17, alpha: 1.0)
        button.setTitle("0%", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.isSelected = true
        
        return button
    }()
    
    lazy private var tenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.22, green: 0.19, blue: 0.33, alpha: 1.0)
        button.setTitle("10%", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var twentyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.09, green: 0.07, blue: 0.17, alpha: 1.0)
        button.setTitle("20%", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        
        return button
    }()
    
    private var chooseSplitLabel: UILabel = {
       let labelView = UILabel()
        labelView.text = "Choose split"
        labelView.font = .systemFont(ofSize: 25)
        labelView.textColor = .lightGray
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelView
    }()
    
    private var splitNumberLabel: UILabel = {
       let labelView = UILabel()
        labelView.text = "2"
        labelView.font = .systemFont(ofSize: 25)
        labelView.textColor = .lightGray
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelView
    }()
    
    lazy private var splitStepper: UIStepper = {
       let stepperView = UIStepper()
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        stepperView.minimumValue = 1
        stepperView.maximumValue = 25
        stepperView.stepValue = 1
        stepperView.value = 2
        stepperView.wraps = false
        stepperView.autorepeat = true
        stepperView.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        return stepperView
    }()
    
    lazy private var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.22, green: 0.19, blue: 0.33, alpha: 1.0)
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)

        return button
    }()
    
    
    @objc private func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        sender.backgroundColor = UIColor(red: 0.22, green: 0.19, blue: 0.33, alpha: 1.0)
        
        //make 10% to 0.1
        calculator.tip = Float((Double(String((sender.currentTitle!).dropLast()))!)/100)
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper!) {
        calculator.stepperValue = Int(sender.value)
        splitNumberLabel.text = String(calculator.stepperValue)
    }
    
    @objc private func calculateButtonPressed(_ sender: UIButton) {
        
        if let _ = billTextField.text {
            calculator.billTotal = Float(billTextField.text!)!
        }
        
        calculator.result = Float(Double(calculator.billTotal) * (1 + Double(calculator.tip)) / Double(calculator.stepperValue))
        
        let currentVC = ResultsViewController()
        navigationController?.pushViewController(currentVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.22, green: 0.19, blue: 0.33, alpha: 1.0)
        
        initSubviews()
        setupConstraints()
    }
    
    private func initSubviews() {
        self.view.addSubview(billLabel)
        self.view.addSubview(billTextField)
        
        self.view.addSubview(bottomView)
        self.view.addSubview(selectTipLabel)
        self.view.addSubview(zeroButton)
        self.view.addSubview(tenButton)
        self.view.addSubview(twentyButton)
        self.view.addSubview(chooseSplitLabel)
        
        self.view.addSubview(calculateButton)
    }

    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //billLabel.heightAnchor.constraint(equalToConstant: 30),
            billLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            billLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
        NSLayoutConstraint.activate([
            //billTextField.heightAnchor.constraint(equalToConstant: 48),
            billTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        let topStackView = UIStackView(arrangedSubviews: [billLabel, billTextField])
        topStackView.axis = .vertical
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.spacing = 26
        topStackView.distribution = .fillEqually
        
        view.addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            //topStackView.heightAnchor.constraint(equalToConstant: 200)
        ])

        
        NSLayoutConstraint.activate([
            selectTipLabel.heightAnchor.constraint(equalToConstant: 30),
            selectTipLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30)
        ])
        
        let percentStackView = UIStackView(arrangedSubviews: [zeroButton, tenButton, twentyButton])
        percentStackView.axis = .horizontal
        percentStackView.translatesAutoresizingMaskIntoConstraints = false
        percentStackView.spacing = 20
        percentStackView.distribution = .fillProportionally
        view.addSubview(percentStackView)
        
        NSLayoutConstraint.activate([
            percentStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            percentStackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            zeroButton.heightAnchor.constraint(equalToConstant: 54),
            zeroButton.widthAnchor.constraint(equalToConstant: 64)
        ])
        NSLayoutConstraint.activate([
            tenButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        NSLayoutConstraint.activate([
            twentyButton.heightAnchor.constraint(equalToConstant: 54),
            twentyButton.widthAnchor.constraint(equalTo: zeroButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        let stepperStackView = UIStackView(arrangedSubviews: [splitNumberLabel, splitStepper])
        stepperStackView.axis = .horizontal
        stepperStackView.translatesAutoresizingMaskIntoConstraints = false
        stepperStackView.spacing = 27
        stepperStackView.distribution = .fill
        view.addSubview(stepperStackView)
        
        
        NSLayoutConstraint.activate([
            splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
            splitNumberLabel.widthAnchor.constraint(equalToConstant: 93)
        ])
        
        NSLayoutConstraint.activate([
            splitStepper.heightAnchor.constraint(equalToConstant: 29),
            splitStepper.widthAnchor.constraint(equalToConstant: 94)
        ])
        
        let mainStackView = UIStackView(arrangedSubviews: [selectTipLabel, percentStackView, chooseSplitLabel, stepperStackView])
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 26
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
        
        bottomView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

