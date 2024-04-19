//
//  CoffeeMarketCell.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 17.12.2023.
//

import UIKit
import SnapKit

struct CoffeeMarketModel: Encodable, Decodable, Equatable{
    let id: Int
    let imageName: String
    let coffeeName: String
    let element: String
    let price: Int
    var checkBookmark: Bool
    var count: Int
    
    static func == (lhs: CoffeeMarketModel, rhs: CoffeeMarketModel) -> Bool {
            return lhs.id == rhs.id &&
                   lhs.imageName == rhs.imageName &&
                   lhs.coffeeName == rhs.coffeeName &&
                   lhs.element == rhs.element &&
                   lhs.price == rhs.price
        }
}

protocol AddCart: AnyObject {
    func addCart(index: Int)
    func addBookMark(index: Int)
}

class CoffeeMarketCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
            // Reset cell content here
    }
    
    private lazy var id = 0
    
    private lazy var imageView = UIImageView()
    
    private lazy var titleView = getUILabel(text: "", font: .boldSystemFont(ofSize: 16))
    private lazy var elementView = getUILabel(text: "", font: .systemFont(ofSize: 12, weight: .thin))
    
    private lazy var priceView = getUILabel(text: "", font: .systemFont(ofSize: 18, weight: .semibold))
    
    private lazy var btnAdd = UIButton()
    
    lazy var btnBookMark = UIButton()

    weak var delegate: AddCart?
    
    @objc private func addCart(){
        delegate?.addCart(index: id)
    }
    
    
    
    @objc private func addBookMark(){
        delegate?.addBookMark(index: id)
    }
    
    private lazy var checkBookMark = false
    
    func configure(model: CoffeeMarketModel){
        imageView.image = UIImage(named: model.imageName)
        titleView.text = model.coffeeName
        elementView.text =  model.element
        priceView.text = "\(model.price) ₸"
        btnAdd.setImage(UIImage(systemName: "plus"), for: .normal)
        id = model.id
        
        btnAdd.backgroundColor = .coffee
        btnAdd.tintColor = .white
        btnAdd.layer.cornerRadius = 15
        btnAdd.layer.masksToBounds = true
        btnAdd.addTarget(self, action: #selector(addCart), for: .touchUpInside)
        
        btnBookMark.setImage(UIImage(systemName: "heart"), for: .normal)
        btnBookMark.tintColor = .systemRed
        btnBookMark.layer.masksToBounds = true
        btnBookMark.addTarget(self, action: #selector(addBookMark), for: .touchUpInside)
       
        
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        if model.checkBookmark {
            btnBookMark.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            btnBookMark.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        setupUI()
    }
    
}
extension CoffeeMarketCell{
    
    private func setupUI(){
        backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        addSubview(imageView)
        addSubview(titleView)
        addSubview(elementView)
        addSubview(priceView)
        addSubview(btnAdd)
        addSubview(btnBookMark)
    }
    
    private func setupConstraints(){
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.8)
        }
        
        titleView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.trailing.equalTo(imageView.snp.trailing)
        }
        
        elementView.snp.makeConstraints { make in
            make.leading.equalTo(titleView.snp.leading)
            make.top.equalTo(titleView.snp.bottom).offset(5)
            make.trailing.equalTo(titleView.snp.trailing)
        }
        
        priceView.snp.makeConstraints { make in
            make.leading.equalTo(elementView.snp.leading)
            make.top.equalTo(elementView.snp.bottom).offset(5)
            make.trailing.equalTo(elementView.snp.trailing).offset(30)
        }
        
        btnAdd.snp.makeConstraints { make in
            make.top.equalTo(elementView.snp.bottom).offset(5)
            make.trailing.equalTo(elementView.snp.trailing)
            make.width.height.equalTo(30)
        }
        btnBookMark.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.width.height.equalTo(20)
        }
    }
}
