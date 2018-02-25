//
//  HomeController.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/24/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit

class HomeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.text = "Core ML Models"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        label.text = "Select a model category you want to test."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categorySliderContainer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkBluish
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let catSlider : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let catSlider = UICollectionView(frame: .zero, collectionViewLayout: layout)
        catSlider.translatesAutoresizingMaskIntoConstraints = false
        catSlider.backgroundColor = UIColor.clear
        catSlider.showsHorizontalScrollIndicator = false
        catSlider.isPagingEnabled = true
        return catSlider
    }()
    
    let infoButton : UIButton = {
        let button = UIButton()
        button.setTitle("Info", for: .normal)
        button.backgroundColor = UIColor.purpleMain
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func infoTapped() {
        let infoVC = InfoView()
        infoVC.modalPresentationStyle = .overCurrentContext
        present(infoVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = UIColor.darkMain
        
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(infoButton)
        infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        infoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        catSlider.delegate = self
        catSlider.dataSource = self
        catSlider.register(CategorySliderCell.self, forCellWithReuseIdentifier: "catId")
        
        view.addSubview(catSlider)
        catSlider.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 40).isActive = true
        catSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        catSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        catSlider.bottomAnchor.constraint(equalTo: infoButton.topAnchor, constant: -40).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryVC = CategoryView()
        categoryVC.modalPresentationStyle = .overCurrentContext
        categoryVC.category = categories[indexPath.row]
        present(categoryVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catId", for: indexPath) as! CategorySliderCell
        cell.category = categories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [CategorySliderCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                
                let translationX = cellFrame.origin.x / 5
                cell.imageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
        }
    }
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}

class CategorySliderCell: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let viewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
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
    
    func setupViews() {
        addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
}





