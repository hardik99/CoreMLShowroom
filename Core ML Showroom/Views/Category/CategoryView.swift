//
//  CategoryView.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/25/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit

class CategoryView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var category : Category? {
        didSet {
            if let title = category?.title {
                titleLabel.text = title
            }
            if let image = category?.image {
                imageView.image = UIImage(named: image)
            }
            if let desc = category?.shortDesc {
                descLabel.text = desc
            }
        }
    }
    
    let closeButtonBlurEffect : UIVisualEffectView = {
        let visualEffect = UIVisualEffectView()
        visualEffect.effect = UIBlurEffect(style: .dark)
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.layer.cornerRadius = 14
        visualEffect.layer.masksToBounds = true
        
        return visualEffect
    }()
    
    let closeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closebt"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let blurredView : UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .dark)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.text = "Title"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        label.text = "Description"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        // Setup View Blur BG
        view.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
        
        // Setup View Content
        view.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        viewContainer.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        
        viewContainer.addSubview(blurredView)
        blurredView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        blurredView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        blurredView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        
        blurredView.contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: blurredView.contentView.topAnchor, constant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: blurredView.contentView.leadingAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: blurredView.contentView.trailingAnchor, constant: -15).isActive = true
        
        blurredView.contentView.addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: blurredView.contentView.leadingAnchor, constant: 15).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: blurredView.contentView.trailingAnchor, constant: -15).isActive = true
        descLabel.bottomAnchor.constraint(equalTo: blurredView.contentView.bottomAnchor, constant: -15).isActive = true
        
        view.addSubview(closeButtonBlurEffect)
        closeButtonBlurEffect.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButtonBlurEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closeButtonBlurEffect.widthAnchor.constraint(equalToConstant: 28).isActive = true
        closeButtonBlurEffect.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        closeButtonBlurEffect.contentView.addSubview(closeButton)
        closeButton.centerXAnchor.constraint(equalTo: closeButtonBlurEffect.contentView.centerXAnchor).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: closeButtonBlurEffect.contentView.centerYAnchor).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButtonBlurEffect.widthAnchor, multiplier: 0.8).isActive = true
        closeButton.heightAnchor.constraint(equalTo: closeButtonBlurEffect.heightAnchor, multiplier: 0.8).isActive = true
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "modelId")
        view.addSubview(categoryTableView)
        categoryTableView.topAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = category?.models.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modelId", for: indexPath) as! CategoryTableViewCell
        if let title = category?.models[indexPath.row].title {
            cell.titleLabel.text = title
        }
        if let desc = category?.models[indexPath.row].shortDesc {
            cell.shortDescLabel.text = desc
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelVC = category?.models[indexPath.row].modelViewController as? ModelViewController
        modelVC?.modalPresentationStyle = .overCurrentContext
        modelVC?.model = category?.models[indexPath.row]
        self.present(modelVC!, animated: true, completion: nil)
    }
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
}

class CategoryTableViewCell : UITableViewCell {
    
    let titleLabel = UILabel()
    let shortDescLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        selectedBackgroundView = bgView
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        contentView.addSubview(shortDescLabel)
        shortDescLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        shortDescLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        shortDescLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        shortDescLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        shortDescLabel.textColor = UIColor.white
        shortDescLabel.numberOfLines = 0
        shortDescLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        shortDescLabel.textColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





