//
//  AppstoreItemTableViewCell.swift
//  GSM
//
//  Created by 문주원 on 2020/11/05.
//

import UIKit

final class AppstoreItemTableViewCell: UITableViewCell {
    var isUpdateConstraint: Bool = false
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "임준명 다이어트 실패"
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    var openButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func updateConstraints() {
        if !isUpdateConstraint {
            isUpdateConstraint = true
            
            addSubview(thumbnailImageView)
            addSubview(titleLabel)
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        }
        super.updateConstraints()
    }
//    var thumbnailImageView: UIImageView?
//    var titleLable: UILabel?
//    var descriptionLable: UILabel?
//    var openButton: UIButton?
//
//    func commonInit() {
//        thumbnailImageView = UIImageView()
//        titleLable = UILabel()
//        descriptionLable = UILabel()
//        openButton = UIButton()
//    }
//    override func awakeFromNib() {
//        commonInit()
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
