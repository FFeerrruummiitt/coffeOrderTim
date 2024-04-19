//
//  TypeCofeeCell.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 17.12.2023.
//

import UIKit
import SnapKit


protocol coffeeSelectType: AnyObject{
    func selectCoffeeType(index: IndexPath)
}

struct coffeTypeStruct: Encodable, Decodable{
    var click: Bool
    let name: String
}

class TypeCoffeeCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        views.addTarget(self, action: #selector(selectType), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    weak var delegate: coffeeSelectType?
    private lazy var index = IndexPath()
    
    lazy var checkClick = false
    
    private lazy var views = UIButton()
    
    func configure(type: coffeTypeStruct, index: IndexPath){
        views.layer.cornerRadius = 12
        views.setTitle(type.name, for: .normal)
        views.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        views.titleLabel?.textAlignment = .center
        views.titleLabel?.numberOfLines = 0
        self.index = index
        
        if type.click {
            views.setTitleColor(.white, for: .normal)
            views.backgroundColor = .coffee
        }else{
            views.setTitleColor(.black, for: .normal)
            views.backgroundColor = .white
        }
        setupUI()
    }
    
    @objc private func selectType(){
        delegate?.selectCoffeeType(index: index)
    }
    
}
extension TypeCoffeeCell{
    private func setupUI(){
        
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        addSubview(views)
    }
    
    private func setupConstraints(){
        views.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
