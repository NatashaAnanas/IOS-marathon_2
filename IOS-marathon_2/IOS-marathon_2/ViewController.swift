//
//  ViewController.swift
//  IOS-marathon_2
//
//  Created by Наталья Коновалова on 04.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var firstButton = FunnyButton(title: "First Button")
    private var secondMediumButton = FunnyButton(title: "Second Medium Button")
    private var thirdButton = FunnyButton(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        addActions()
        addSubviews()
        setupConstraints()
    }
    
    private func addActions() {
        thirdButton.addTarget(self,
                              action: #selector(thirdButtonAction(sender:)),
                              for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubviews(firstButton, secondMediumButton, thirdButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondMediumButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8),
            secondMediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondMediumButton.bottomAnchor, constant: 8),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func thirdButtonAction(sender: UIButton) {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true)
    }
}
