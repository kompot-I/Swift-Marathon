//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Nikita Zubov on 21.02.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    private var topView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0.09, green: 0.07, blue: 0.17, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var totalLabel: UILabel = {
       let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Total Per Person"
        labelView.font = .systemFont(ofSize: 30)
        labelView.textColor = .lightGray
        labelView.textAlignment = .center
        
        return labelView
    }()
    
    private var bilLabel: UILabel = {
       let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "56.7"
        labelView.font = .systemFont(ofSize: 50)
        labelView.textColor = .white
        labelView.textAlignment = .center
        
        return labelView
    }()
    
    lazy private var recalculateButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.09, green: 0.07, blue: 0.17, alpha: 1.0)
        button.layer.cornerRadius = CGFloat(20)
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    @objc func recalculateButtonPressed() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.22, green: 0.19, blue: 0.33, alpha: 1.0)
        
        bilLabel.text = String(format: "%.2f", calculator.result)

        // Do any additional setup after loading the view.
        initSubviews()
        setConstraints()
    }
    
    private func initSubviews() {
        self.view.addSubview(topView)
        
        self.view.addSubview(totalLabel)
        self.view.addSubview(bilLabel)
        
        self.view.addSubview(recalculateButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.heightAnchor.constraint(equalToConstant: 34),
            totalLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            totalLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bilLabel.heightAnchor.constraint(equalToConstant: 100),
            bilLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            bilLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            bilLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
