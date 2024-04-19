//
//  BookMark.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit
import SnapKit

class BookMark: UIViewController, AddCart{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeMark.delegate = self
        coffeeMark.dataSource = self
        coffeeMark.register(CoffeeMarketCell.self, forCellWithReuseIdentifier: "Coffees")
        view.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.928, alpha: 1)
        
        setupUI()
    }
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "My BookMark"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    

    
}
extension BookMark {
    private func setupUI(){

        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(titleView)
        view.addSubview(coffeeMark)
    }
    
    private func setupConstraints(){
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview()
        }
        
        coffeeMark.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
    }
}

extension BookMark: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookMarkData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coffees", for: indexPath) as! CoffeeMarketCell
            cell.configure(model: bookMarkData[indexPath.item])
            cell.delegate = self
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width/2.5, height: view.frame.height/4)
        
    }
    
    func addBookMark(index: Int) {
        
        coffeesData[index].checkBookmark.toggle()
        
        if coffeesData[index].checkBookmark {
            bookMarkData.append(coffeesData[index])
        }else{
            bookMarkData.removeAll { $0 == coffeesData[index]}
        }
        
        coffeeMark.reloadData()
        
    }
    
    func addCart(index: Int) {
        
        if !dataForCart.contains(coffeesData[index]) {
            dataForCart.append(coffeesData[index])
        }
    }
  
}

 var coffeeMark: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    collectionView.collectionViewLayout = layout
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.backgroundColor = .clear

    return collectionView
}()
