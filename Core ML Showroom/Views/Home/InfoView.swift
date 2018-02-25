//
//  InfoView.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/24/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit
import SafariServices

class InfoView: UIViewController {
    
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
        label.text = "Core ML Showroom"
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel : UILabel = {
        let label = UILabel()
        label.text = "by ghearly"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel : UILabel = {
        let label = UILabel()
        label.text = " Thank you for using Core ML Showroom, feel free to modify the codebase however you want and feel free to contact me via twitter."
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let twitterButton : UIButton = {
        let button = UIButton()
        button.setTitle("Twitter", for: .normal)
        button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.3)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(twitterTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let githubButton : UIButton = {
        let button = UIButton()
        button.setTitle("Github", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(githubTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let coreMLDocsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Core ML Documentation", for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(coreMLDocsTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let awesomeCoreMLModelsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Awesome Core ML Models", for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(awesomeCoreMLModelsTapped), for: .touchUpInside)
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
        
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(twitterButton)
        twitterButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 20).isActive = true
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(githubButton)
        githubButton.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 20).isActive = true
        githubButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        githubButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        githubButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(coreMLDocsButton)
        coreMLDocsButton.topAnchor.constraint(equalTo: githubButton.bottomAnchor, constant: 20).isActive = true
        coreMLDocsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coreMLDocsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coreMLDocsButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
        view.addSubview(awesomeCoreMLModelsButton)
        awesomeCoreMLModelsButton.topAnchor.constraint(equalTo: coreMLDocsButton.bottomAnchor, constant: 20).isActive = true
        awesomeCoreMLModelsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        awesomeCoreMLModelsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        awesomeCoreMLModelsButton.widthAnchor.constraint(equalToConstant: 295).isActive = true
        
    }
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func twitterTapped() {
        guard let url = URL(string: "https://twitter.com/ghearlydev") else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @objc func githubTapped() {
        guard let url = URL(string: "https://github.com/ghearly") else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @objc func coreMLDocsTapped() {
        guard let url = URL(string: "https://developer.apple.com/documentation/coreml") else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @objc func awesomeCoreMLModelsTapped() {
        guard let url = URL(string: "https://github.com/likedan/Awesome-CoreML-Models") else {return}
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = UIColor.darkMain
        self.present(safariVC, animated: true, completion: nil)
    }
}








