//
//  ViewController.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/24/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit

class OnboardingItemView: UICollectionViewCell {
    
    var onboardingPageInfo : OnboardingPages? {
        didSet {
            if let iconImage = onboardingPageInfo?.image {
                iconImageView.image = UIImage(named: iconImage)
            }
            
            if let titleString = onboardingPageInfo?.title, let descString = onboardingPageInfo?.description {
                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = .center
                let bodyText = NSMutableAttributedString(string: titleString.uppercased(), attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18),
                                                                                                                        NSAttributedStringKey.foregroundColor : UIColor.white,
                                                                                                                        NSAttributedStringKey.paragraphStyle : paragraph
                    ])
                bodyText.append(NSAttributedString(string: "\n\n" + descString, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular),
                                                                                                                                                                              NSAttributedStringKey.foregroundColor : UIColor.white,
                                                                                                                                                                              NSAttributedStringKey.paragraphStyle : paragraph
                    ]))
                bodyTextView.attributedText = bodyText
            }
            
        }
    }
    
    let iconContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bodyTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(){
        
        // Set View Background Color
        backgroundColor = UIColor.darkMain
        
        // Setup Contraints and Views
        addSubview(iconContainer)
        iconContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        iconContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        iconContainer.addSubview(iconImageView)
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconContainer.widthAnchor, multiplier: 0.5).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconContainer.heightAnchor, multiplier: 0.5).isActive = true
        addSubview(bodyTextView)
        bodyTextView.topAnchor.constraint(equalTo: iconContainer.bottomAnchor).isActive = true
        bodyTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        bodyTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        bodyTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // Setup Demo Content
        
        // END Demo Content
    }
}

