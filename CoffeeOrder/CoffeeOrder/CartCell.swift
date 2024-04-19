//
//  CartCell.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 17.12.2023.
//

import UIKit

protocol cartProtocol: AnyObject {
    func delete(index: Int)
    
    func plus(index: Int)
    
    func minus(index: Int)
}

class CartCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: cartProtocol?
    
    private lazy var view = UIView()
    
    private lazy var id = 0
    
    private lazy var coffeImage = UIImageView()
    
    private lazy var titleView = getUILabel(text: "", font: .boldSystemFont(ofSize: 16))
    private lazy var elementView = getUILabel(text: "", font: .systemFont(ofSize: 12, weight: .thin))
    
    private lazy var priceView = getUILabel(text: "", font: .systemFont(ofSize: 18, weight: .semibold))
    
    private lazy var deleteBtn = getBtn(imageName: "xmark.circle", color: .systemRed)
    
    @objc private func deleteRow(){
        delegate?.delete(index: id)
    }
    
    private lazy var containerForCounter = UIView()
    private lazy var plusBtn = getBtn(imageName: "plus", color: .white)
    private lazy var minusBtn = getBtn(imageName: "minus", color: .white)
    private lazy var counter = getUILabel(text: "", font: .boldSystemFont(ofSize: 14))
    
    @objc private func plusCount() {
        delegate?.plus(index: id)
    }
    
    @objc private func minusCount() {
        delegate?.minus(index: id)
    }
    
    private func getBtn(imageName: String, color: UIColor) -> UIButton{
        let btn = UIButton()
        btn.setImage(UIImage(systemName: imageName), for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.tintColor = color
        return btn
    }
    
    func configure(model: CoffeeMarketModel){
        coffeImage.image = UIImage(named: model.imageName)
        titleView.text = model.coffeeName
        elementView.text =  model.element
        priceView.text = "\(model.price) ₸"
        id = model.id
        
        backgroundColor = .clear
        deleteBtn.addTarget(self, action: #selector(deleteRow), for: .touchUpInside)
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        
        plusBtn.backgroundColor = .coffee
        minusBtn.backgroundColor = .coffee
        counter.text = "\(model.count)"
        containerForCounter.backgroundColor =  UIColor(red: 0.929, green: 0.929, blue: 0.928, alpha: 1)
        containerForCounter.layer.cornerRadius = 8
        counter.textAlignment = .center
        
        plusBtn.addTarget(self, action: #selector(plusCount), for: .touchUpInside)
        minusBtn.addTarget(self, action: #selector(minusCount), for: .touchUpInside)
        
        setupUI()
    }
    
}

extension CartCell {
    private func setupUI(){
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        addSubview(view)
        view.addSubview(coffeImage)
        view.addSubview(titleView)
        view.addSubview(elementView)
        view.addSubview(priceView)
        view.addSubview(deleteBtn)
        
        view.addSubview(containerForCounter)
        containerForCounter.addSubview(minusBtn)
        containerForCounter.addSubview(counter)
        containerForCounter.addSubview(plusBtn)
        
    }
    
    private func setupConstraints(){
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coffeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.height.equalToSuperview().dividedBy(1.2)
        }
        
        titleView.snp.makeConstraints { make in
            make.leading.equalTo(coffeImage.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        elementView.snp.makeConstraints { make in
            make.leading.equalTo(coffeImage.snp.trailing).offset(10)
            make.top.equalTo(titleView.snp.bottom).offset(5)
        }
        
        priceView.snp.makeConstraints { make in
            make.top.equalTo(elementView.snp.bottom).offset(15)
            make.leading.equalTo(coffeImage.snp.trailing).offset(10)

        }
        
        deleteBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.width.height.equalTo(40)
        }
        
        containerForCounter.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.5)
            make.height.equalToSuperview().dividedBy(4)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        minusBtn.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.5)
            make.leading.equalToSuperview().offset(3)
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().inset(3)
        }
        
        plusBtn.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.5)
            make.trailing.equalToSuperview().inset(3)
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().inset(3)
        }
        
        counter.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(minusBtn.snp.trailing)
            make.trailing.equalTo(plusBtn.snp.leading)
            make.top.bottom.equalToSuperview()
        }
    }
}
