//
//  TabBarController.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 1.10.21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Private Data
    let qrViewControllerTitle = "QR-Code"
    let heroesViewControllerTitle = "Heroes"
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.selectedIndex = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: - Change tab bar icons
        let qrViewController = UIStoryboard(name: String(describing: ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ViewController.self))
        let qrIcon = UITabBarItem(title: qrViewControllerTitle, image: R.image.icon_qr_code_tab_bar(), selectedImage: R.image.icon_qr_code_tab_bar())
        qrViewController.tabBarItem = qrIcon
        
        let heroesViewController = UIStoryboard(name: String(describing: HeroesCollectionViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: HeroesCollectionViewController.self))
        let heroesIcon = UITabBarItem(title: heroesViewControllerTitle, image: R.image.icon_chosed_heroes_tab(), selectedImage: R.image.icon_chosed_heroes_tab())
        heroesViewController.tabBarItem = heroesIcon
        let controllers = [qrViewController, heroesViewController]
        
        self.viewControllers = controllers
    }

    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

