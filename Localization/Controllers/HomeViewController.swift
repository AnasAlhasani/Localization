//
//  HomeViewController.swift
//  Localization
//
//  Created by Anas Alhasani on 11/22/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        setupViews()
    }
    
}

//MARK: - Helpers
private extension HomeViewController {
    
    func setupViews() {
        title = "Title.Home".localized
        nameLabel.text = "Label.Name".localized
    }
    
    func addBackButton() {
        let image = UIImage(named: "RightArrow")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        if Localizer.shared.currentUserLanguage == Constant.LanguageCode.arabic {
            button.transform = button.transform.rotated(by: CGFloat.pi)
        }
        let backItem = UIBarButtonItem(customView: button)
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = backItem
    }
}

//MARK: - Interactions
private extension HomeViewController {
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func didEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
