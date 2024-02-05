//
//  FunnyButton.swift
//  IOS-marathon_2
//
//  Created by Наталья Коновалова on 05.02.2024.
//

import UIKit

final class FunnyButton: UIButton {
    
    private enum Constants: String {
        case arrowRightCircleFill = "arrow.right.circle.fill"
    }
    
    private let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
        configuration = setupBaseConfiguration()
        addTargets(self, action: #selector(buttonAction), for: .touchUpInside, .touchUpOutside, .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case .dimmed:
            backgroundColor = .systemGray2
            titleLabel?.textColor = UIColor.systemGray3
            imageView?.tintColor = UIColor.systemGray3
        default:
            configuration?.baseBackgroundColor = .systemBlue
            configuration?.baseForegroundColor = .white
        }
    }
    
    private func setupBaseConfiguration() -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.imagePadding = 8
        buttonConfiguration.imagePlacement = .trailing
        buttonConfiguration.image = UIImage(systemName: Constants.arrowRightCircleFill.rawValue)
        buttonConfiguration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                    leading: 14,
                                                                    bottom: 10,
                                                                    trailing: 14)
        return buttonConfiguration
    }
    
    private func addTargets(_ target: Any?, action: Selector, for events: UIControl.Event...) {
        events.forEach { addTarget(self, action: #selector(buttonAction), for: $0) }
    }
    
    @objc func buttonAction(sender: UIButton) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.5,
                       options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = .init(scaleX: 0.85, y: 0.85)
        } completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0.5,
                           options: [.allowUserInteraction, .beginFromCurrentState]) {
                sender.transform = .init(scaleX: 1, y: 1)
            }
        }
    }
}
