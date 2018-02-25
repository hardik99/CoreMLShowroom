//
//  ModelInfoViewController.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/25/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit
import SafariServices

class ModelInfoViewController: UIViewController {
    
    var refUrl = ""
    var demoUrl = ""
    
    var model : Model? {
        didSet {
            if let title = model?.title {
                titleLabel.text = title
            }
            
            if let shortDesc = model?.shortDesc {
                subtitleLabel.text = shortDesc
            }
            
            if let longDesc = model?.longDesc {
                contentTextView.text = longDesc
            }
            
            if let refURL = model?.referenceURL {
                refUrl = refURL
            }
            
            if let demoURL = model?.demoURL {
                demoUrl = demoURL
            }
        }
    }

    let closeButtonBlurEffect : UIVisualEffectView = {
        let visualEffect = UIVisualEffectView()
        visualEffect.effect = UIBlurEffect(style: .light)
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
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Short Dest"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentTextView : UITextView = {
        let textView = UITextView()
        textView.text = "Content"
        textView.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        textView.textColor = UIColor.white
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let refButton : UIButton = {
        let button = UIButton()
        button.setTitle("Reference", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(refTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let demoButton : UIButton = {
        let button = UIButton()
        button.setTitle("Demo", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(demoTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        view.addSubview(demoButton)
        demoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        demoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        demoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        demoButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(refButton)
        refButton.bottomAnchor.constraint(equalTo: demoButton.topAnchor, constant: -20).isActive = true
        refButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        refButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        refButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(contentTextView)
        contentTextView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30).isActive = true
        contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: refButton.topAnchor, constant: -30).isActive = true
        
    }
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func refTapped() {
        guard let url = URL(string: refUrl) else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @objc func demoTapped() {
        guard let url = URL(string: demoUrl) else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
}
