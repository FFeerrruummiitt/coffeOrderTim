//
//  ViewController.swift
//  CoffeeOrder
//
//  Created by bakebrlk on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private lazy var onbordingImage = UIImageView(image: UIImage(named: "onbording"))
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Coffee so good, \nyour taste buds \nwill love it."
        label.font = .systemFont(ofSize: 36, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionView: UILabel = {
        let label = UILabel()
        label.text = "The best grain, the finest roast, the powerful flavor."
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "coffee")
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(tapNext), for: .touchUpInside)
        return btn
    }()
    
    @objc private func tapNext(){
        navigationController?.pushViewController(TabBar(), animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
extension ViewController{
    private func setupUI(){
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(onbordingImage)
        view.addSubview(titleView)
        view.addSubview(descriptionView)
        view.addSubview(btn)
    }
    
    private func setupConstraints(){
        onbordingImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.5)
        }
        
        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(onbordingImage.snp.bottom)
        }
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(13)
            
        }
    }
}

