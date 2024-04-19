//
//  MarketView .swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit
import SnapKit

class MarketView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.928, alpha: 1)
        typeCoffeeCollection.backgroundColor = .clear
        
        setupUI()
    }
    
    private lazy var navBar = UIView()
    private lazy var locationView = getUILabel(text: "Location", font: .systemFont(ofSize: 12, weight: .thin))
    
    private lazy var locationCityView = getUILabel(text: "Kazakhstan, Almaty", font: .systemFont(ofSize: 14, weight: .semibold))
    
    private lazy var avatar = UIImageView(image: UIImage(named: "avatar"))
    
    private lazy var searchView = UIView()
    private lazy var searchImage = UIImageView(image: UIImage(named: "searchImage"))
    private lazy var searchTextField: UITextField = {
        let field = UITextField()
        field.textColor = .white
        field.tintColor = UIColor(named: "coffee")
        field.attributedPlaceholder = NSAttributedString(string: "Search coffee", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])

        return field
    }()
    
    private lazy var searchImageGlass = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
    private lazy var advImage = UIImageView(image: UIImage(named: "adv"))
    
    private lazy var typeCoffeeCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TypeCoffeeCell.self, forCellWithReuseIdentifier: "typeCoffee")
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    private lazy var preIndex = 0
    
    
    private lazy var coffeeMarket: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoffeeMarketCell.self, forCellWithReuseIdentifier: "Coffees")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self

        return collectionView
    }()
    
    
    

}
extension MarketView {
    private func setupUI(){
        navBar.backgroundColor = UIColor(named: "Myblack")
        avatar.layer.cornerRadius = 8
        avatar.layer.masksToBounds = true
        locationView.textColor = .systemGray6
        locationCityView.textColor = .white
        searchView.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)
        searchView.layer.cornerRadius = 16
        searchImageGlass.tintColor = .systemGray

        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(navBar)
        view.addSubview(locationView)
        view.addSubview(locationCityView)
        view.addSubview(avatar)
        view.addSubview(searchView)
        searchView.addSubview(searchTextField)
        searchView.addSubview(searchImage)
        searchView.addSubview(searchImageGlass)
        navBar.addSubview(advImage)
        view.addSubview(typeCoffeeCollection)
        view.addSubview(coffeeMarket)
    }
    
    private func setupConstraints(){
        navBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.5)
        }
        
        locationView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(100)
        }
        
        locationCityView.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        avatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.width.height.equalTo(50)
            make.trailing.equalToSuperview().inset(20)
        }
        searchView.snp.makeConstraints { make in
            make.top.equalTo(avatar.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(14)
        }
        
        searchImageGlass.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        searchImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(40)
            make.height.equalToSuperview()
        }
        
        advImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(70)
        }
        
        typeCoffeeCollection.snp.makeConstraints { make in
            make.top.equalTo(advImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16)
        }
        
        coffeeMarket.snp.makeConstraints { make in
            make.top.equalTo(typeCoffeeCollection.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-82)
        }
    }
}

extension MarketView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == typeCoffeeCollection){
            return typeCoffeeData.count
        }else{
            return coffeesData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == typeCoffeeCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCoffee", for: indexPath) as! TypeCoffeeCell
            
            
            cell.configure(type: typeCoffeeData[indexPath.item], index: indexPath)
            cell.delegate = self
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coffees", for: indexPath) as! CoffeeMarketCell
            cell.configure(model: coffeesData[indexPath.item])
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == typeCoffeeCollection {
            return CGSize(width: view.frame.width/3.5, height: view.frame.height/20)
        }else {
            return CGSize(width: view.frame.width/2.5, height: view.frame.height/4)
        }
    }
  
}

extension MarketView: coffeeSelectType{
    
    func selectCoffeeType(index: IndexPath) {
        
        typeCoffeeData[preIndex].click = false
        typeCoffeeData[index.item].click = true
        
        preIndex = index.item

        typeCoffeeCollection.reloadData()
        
        
    }
}

extension MarketView: AddCart {
    
    func addBookMark(index: Int) {
        
        coffeesData[index].checkBookmark.toggle()
        
        if coffeesData[index].checkBookmark {
            bookMarkData.append(coffeesData[index])
        }else{
            bookMarkData.removeAll { $0 == coffeesData[index]}
        }
        
        coffeeMarket.reloadData()
        coffeeMark.reloadData()
    }
    
    func addCart(index: Int) {
        
        if !dataForCart.contains(coffeesData[index]) {
            coffeesData[index].count = 1
            dataForCart.append(coffeesData[index])
        }
        activeInf()
        cartTable.reloadData()
    }
}

func getUILabel(text: String, font: UIFont) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    label.numberOfLines = 0
    return label
}
