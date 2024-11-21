//  SettingCell.swift
//  table
//
//  Created by Xiao E on 2024/11/20.
//

import Foundation
import UIKit
import SnapKit

class SettingCell: UITableViewCell {
    var nameLabel = UILabel()
    var arrowImageView = UIImageView()
    var mainView = UIView()
    lazy var line = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }

    private func setupSubViews() {
        contentView.addSubview(mainView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(nameLabel)

        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(arrowImageView)

        line.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(line)

        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        arrowImageView.image = UIImage(named: "arrow")
        line.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)

        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        arrowImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }

        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        line.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    func setupCellCorners(cellType: SettingCellType) {
        mainView.layer.cornerRadius = 0
        mainView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        mainView.backgroundColor = .white

        switch cellType {
        case .single:
            mainView.layer.cornerRadius = 8
            mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            line.isHidden = true
        case .top:
            mainView.layer.cornerRadius = 8
            mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            line.isHidden = false
        case .middle:
            mainView.layer.cornerRadius = 0
            line.isHidden = false
        case .bottom:
            mainView.layer.cornerRadius = 8
            mainView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            line.isHidden = true
        }
    }
}
