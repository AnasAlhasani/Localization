//
//  Localizer.swift
//  Localization
//
//  Created by Anas Alhasani on 11/22/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

class Localizer {
    
    private lazy var localizableDictionary: NSDictionary? = {
        return getlocalizableDictionary(currentUserLanguage)
    }()
    
    var currentUserLanguage: String {
        get{
            return UserDefaults.standard.string(forKey: Constant.UserDefaultsKeys.currentLanguage)
                ?? Bundle.main.preferredLocalizations[0]
        } set {
            UserDefaults.standard.set(newValue, forKey: Constant.UserDefaultsKeys.currentLanguage)
        }
    }
    
    class var shared: Localizer {
        struct Static {
            static let instance = Localizer()
        }
        return Static.instance
    }
    
    func setUserLanguage(_ language: String) {
        
        guard language != currentUserLanguage else { return }
        
        localizableDictionary = getlocalizableDictionary(language)
        
        currentUserLanguage = language
        
        UserDefaults.standard.synchronize()
    }
    
    func setupInterfaceLayoutDirection() {
        if currentUserLanguage == Constant.LanguageCode.english {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
}

fileprivate extension Localizer {
    
    func localize(string: String) -> String {
        
        guard
            let localizableDictionary = localizableDictionary,
            let localizedString = localizableDictionary.value(forKey: string) as? String
        else {
            assertionFailure("Missing translation for: \(string)")
            return ""
        }
        return localizedString
    }
    
    func getlocalizableDictionary(_ language: String) -> NSDictionary? {
        
        guard let path = Bundle.main.path(
            forResource: Constant.Localizable.fileName,
            ofType: Constant.Localizable.type,
            inDirectory: nil,
            forLocalization: language
        ) else {
            fatalError("Localizable file NOT found")
        }
        return NSDictionary(contentsOfFile: path)
    }
}

extension String {
    var localized: String {
        return Localizer.shared.localize(string: self)
    }
}



