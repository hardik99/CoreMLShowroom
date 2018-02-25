//
//  OnboardingView.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/24/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import UIKit
import AVKit

class OnboardingView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = onboardingPages.count
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let startButton : UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func startTapped() {
        present(HomeView(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(OnboardingItemView.self, forCellWithReuseIdentifier: "pageId")
        collectionView?.isPagingEnabled = true
        
        setupView()
        
    }
    
    private func setupView(){
        view.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10).isActive = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingPages.count
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            startButton.isHidden = false
            askForCameraPermission()
        } else {
            startButton.isHidden = true
        }
        
    }
    
    func askForCameraPermission() {
        let mediaType = AVMediaType.video
        AVCaptureDevice.requestAccess(for: mediaType) {
            (granted) in
            if granted == false {
                let alert = UIAlertController(title: "Sorry, we need access!", message: "We need access to your iPhone's camera in order to let you test some of the Core ML models.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Set Permission", style: .default, handler: { (_) in
                    self.askForCameraPermission()
                }))
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageId", for: indexPath) as! OnboardingItemView
        cell.onboardingPageInfo = onboardingPages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
}
