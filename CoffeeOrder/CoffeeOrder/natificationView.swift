//
//  natificationView.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit
import SnapKit

var natTable = UITableView()

var natData = [CoffeeMarketModel]()

class natificationView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.928, alpha: 1)
        
        setupUI()
    }
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "My Natification"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
}

extension natificationView {
    private func setupUI(){
        natTable.dataSource = self
        natTable.delegate = self
        natTable.register(natCell.self, forCellReuseIdentifier: "nat")
        natTable.backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(titleView)
        view.addSubview(natTable)
    }
    
    private func setupConstraints(){
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.trailing.equalToSuperview()
        }
        
        natTable.snp.makeConstraints { make in
            make.top.equalTo(titleView).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}
extension natificationView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return natData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nat", for: indexPath) as! natCell
        
        cell.selectionStyle = .none
        cell.configure(model: natData[indexPath.row])
        
        return cell
    }
    
    
}
