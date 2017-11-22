//
//  LaunchViewController.swift
//  Localization
//
//  Created by Anas Alhasani on 11/22/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var switchLanguageButton: UIButton!
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

//MARK: - Helper Methods
private extension LaunchViewController {
    
    func setupViews() {
        welcomeLabel.text = "Label.Welcome".localized
        startButton.setTitle("Button.Start".localized, for: .normal)
        switchLanguageButton.setTitle("Button.SwitchLanguage".localized, for: .normal)
    }
    
    func flipViewController() {
        
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        
        if Localizer.shared.currentUserLanguage == Constant.LanguageCode.english {
            Localizer.shared.setUserLanguage(Constant.LanguageCode.arabic)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            Localizer.shared.setUserLanguage(Constant.LanguageCode.english)
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        if let app = UIApplication.shared.delegate as? AppDelegate,
            let window = app.window {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
            window.rootViewController = navigationController
            
            UIView.transition(with: window, duration: 0.5, options: transition, animations: nil, completion: nil)
        }
    }
}

//MARK: - Interactions
private extension LaunchViewController {

    @IBAction func switchLanguageButtonButtonTapped(_ sender: UIButton) {
        flipViewController()
    }
}
