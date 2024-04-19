//
//  natCell.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 17.12.2023.
//

import UIKit

class natCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var view = UIView()
    private lazy var image = UIImageView()
    private lazy var title = getUILabel(text: "", font: .boldSystemFont(ofSize: 18))
    private lazy var descriptionView = getUILabel(text: "", font: .systemFont(ofSize: 16))
    private lazy var status = getUILabel(text: "Successful", font: .systemFont(ofSize: 18, weight: .heavy))
    
    func configure(model: CoffeeMarketModel){
        image.image = UIImage(named: model.imageName)
        title.text = model.coffeeName
        descriptionView.text = model.element
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        
        backgroundColor = .clear
        status.textColor = .systemGreen
        
        setupUI()
    }
    
}

extension natCell {
    
    private func setupUI(){
        setupViews()
        setupConstraints()
    }
        
    private func setupViews(){
        addSubview(view)
        view.addSubview(image)
        view.addSubview(title)
        view.addSubview(descriptionView)
        view.addSubview(status)
    }
    
    private func setupConstraints(){
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.height.equalToSuperview().dividedBy(1.2)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.centerY.equalToSuperview().offset(-15)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.centerY.equalToSuperview().offset(15)
        }
        
        status.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.top.equalTo(descriptionView.snp.bottom).offset(20)
        }
    }
}
