//
//  cartView.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit
import SnapKit


var cartTable = UITableView()
var indexForTable = 0

var counts = getUILabel(text: "", font: .systemFont(ofSize: 18, weight: .thin))
var price = getUILabel(text: "", font: .boldSystemFont(ofSize: 20))
var okBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("OK", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = .coffee
    btn.layer.cornerRadius = 16
    btn.layer.masksToBounds = true
    return btn
}()

class cartView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.928, alpha: 1)
        
        setupUI()
    }
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "My Cart"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var fullInformation = UIView()
    
    @objc private func tapOK(){
        natData = dataForCart
        dataForCart.removeAll()
        activeInf()
        cartTable.reloadData()
        natTable.reloadData()
    }
}

extension cartView {
    
    private func setupUI(){
        cartTable.register(CartCell.self ,forCellReuseIdentifier: "CartCell")
        cartTable.delegate = self
        cartTable.dataSource = self
        cartTable.backgroundColor = .clear
        okBtn.addTarget(self, action: #selector(tapOK), for: .touchUpInside)
        
        fullInformation.layer.cornerRadius = 16
        fullInformation.layer.masksToBounds = true
        fullInformation.backgroundColor = .white
        
        activeInf()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(titleView)
        view.addSubview(cartTable)
        view.addSubview(fullInformation)
        fullInformation.addSubview(counts)
        fullInformation.addSubview(price)
        fullInformation.addSubview(okBtn)
    }
    
    private func setupConstraints(){
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview()
        }
        
        fullInformation.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-90)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(10)
        }
        
        cartTable.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        
        counts.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(-15)
        }
        
        price.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(15)
        }
        
        okBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
}

extension cartView: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataForCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.delegate = self
        cell.selectionStyle = .none
        
        cell.configure(model: dataForCart[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
    }
    
}

extension cartView: cartProtocol{
    
    func plus(index: Int) {
        let id = dataForCart.indices.filter {dataForCart[$0] == coffeesData[index]}.first!
        
        if dataForCart[id].count < 9 {
            dataForCart[id].count += 1
        }
        activeInf()
        cartTable.reloadData()
    }
    
    func minus(index: Int) {
        
        let id = dataForCart.indices.filter {dataForCart[$0] == coffeesData[index]}.first ?? 0
        if dataForCart[id].count > 1 {
            dataForCart[id].count -= 1
        }else{
            delete(index: index)
        }
        activeInf()
        cartTable.reloadData()

    }
    
    
    func delete(index: Int) {
        dataForCart.removeAll { $0 == coffeesData[index]}
        activeInf()
        cartTable.reloadData()
    }
    
    
}

public func activeInf() {
    var count = 0
    var prices = 0
    
    for i in dataForCart {
        count += i.count
        prices += (i.count * i.price)
    }
    
    counts.text = "Count: \(count)"
    price.text = "Price: \(prices) ₸"
}
