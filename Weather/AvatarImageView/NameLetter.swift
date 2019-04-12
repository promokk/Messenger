//
//  NameLetters.swift
//  Weather
//
//  Created by Andrey Vorobyv on 18.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

enum Letter: Int {
    case letterB
    case letterE
    case letterA
    case letterM
    case letterD
        
    static let allLetters: [Letter] = [letterB, letterE, letterA, letterM, letterD]
        
    var title: String {
        switch self {
        case .letterB: return "B"
        case .letterE: return "E"
        case .letterA: return "A"
        case .letterM: return "M"
        case .letterD: return "D"
        }
    }
}

@IBDesignable class NameLetter: UIControl {
    
    var selectedLetter: Letter? = nil {
        didSet {
            self.updateSelectedLetter()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        for letter in Letter.allLetters {
            let button = UIButton(type: .system)
            button.setTitle(letter.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectLetter(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    private func updateSelectedLetter() {
        for (index, button) in self.buttons.enumerated() {
            guard let letter = Letter(rawValue: index) else { continue }
            button.isSelected = letter == self.selectedLetter
        }
    }
    
    @objc private func selectLetter(_ sender: UIButton) {
        guard let index = self.buttons.index(of: sender) else { return }
        guard let letter = Letter(rawValue: index) else { return }
        self.selectedLetter = letter
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}

