//
//  Onboarding.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/24/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import Foundation

struct OnboardingPages {
    
    let title : String
    let description : String
    let image : String
    
}

let onboardingPages = [OnboardingPages(title: "Take advantage of Core ML", description: "Core ML lets you integrate a broad variety of machine learning model types into your app.", image: "slide1"),
                       OnboardingPages(title: "Test Core ML models", description: "This app lets you test Core ML models and it’s applications.", image: "slide2"),
                       OnboardingPages(title: "Customize this app", description: "This app is an open-source project, feel free to download the sourcecode and make changes to it.", image: "slide3"),
                       OnboardingPages(title: "Allow access to your camera", description: "We need access to your iPhone's camera in order to let you test some of the Core ML models.", image: "slide4")
]
