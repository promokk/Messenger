//
//  AllNamesCellLayout.swift
//  Weather
//
//  Created by Andrey Vorobyv on 11.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import UIKit

class AllNamesCellLayout: UITableViewCell {
    
    static let reuseId = "AllNamesCellLayout"
    
    //MARK: - Subviews
    private let nameLabel = UILabel()
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.backgroundColor = .white
        return icon
    }()
    
    //MARK: - Privates
    private let offset: CGFloat = 12
    private let iconWidth: CGFloat = 40
    private let defaultFont = UIFont.systemFont(ofSize: 12)
    private var nameText: String?
    
    //MARK: - Inits
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupViews()
//    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    private func setupViews() {
        
        nameLabel.backgroundColor = .white
        nameLabel.font = defaultFont
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
        contentView.addSubview(iconImageView)
    }
    
    public func configure(with urlString: URL?, nameText: String?) {
        
        nameLabel.text = nameText
        iconImageView.kf.setImage(with: urlString)
        self.setNeedsLayout()
    }
    
    //MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setIconFrame()
        setNameLabelFrame()
    }
    
    private func setIconFrame() {
        let iconSize = CGSize(width: iconWidth, height: iconWidth)
        let iconOrigin = CGPoint(x: 16,
                                 y: 2)
        
        iconImageView.frame = CGRect(origin: iconOrigin, size: iconSize)
    }
    
    private func setNameLabelFrame() {
        guard let nameText = nameLabel.text?.nonEmpty else { return }
        let nameLabelSize = getLabelSize(text: nameText, font: nameLabel.font)
        let nameOrigin = CGPoint(x: 64, y: 11.5)
        
        nameLabel.frame = CGRect(origin: nameOrigin, size: nameLabelSize)
    }
    
    //MARK: - Helpers
    private func getLabelSize(text: String, font: UIFont) -> CGSize {
        let maxWidth = contentView.bounds.width - 2 * offset
        let textblock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        
        let rect = text.boundingRect(with: textblock,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        
        let width = rect.size.width.rounded(.up)
        let height = rect.size.height.rounded(.up)
        
        return CGSize(width: width, height: height)
    }
}

extension Collection {
    var nonEmpty: Self? {
        return isEmpty ? nil : self
    }
}

