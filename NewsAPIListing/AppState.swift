//
//  AppState.swift
//  NewsAPIListing
//
//  Created by Полина on 19.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import UIKit

//Класс singltone для изменения состояния приложения/переключения окна приложения смена сцен UIWindowScene UIWindow

class AppState{
    
    static var shared = AppState()
    
    var mainWindow: UIWindow?
    var secondWindow: UIWindow?
    
    private init() {}
    
    func toggleOverlay() {
        if let secondWin = secondWindow {
            if secondWin.isKeyWindow {
                mainWindow?.makeKeyAndVisible()
                secondWin.isHidden = true
            } else {
                secondWindow?.isHidden = false
                secondWin.makeKeyAndVisible()
            }
        }
    }
}
